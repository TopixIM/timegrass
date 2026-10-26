import assert from 'node:assert/strict';
import {execFileSync} from 'node:child_process';
import {readFileSync,writeFileSync,mkdirSync,readdirSync} from 'node:fs';
import {createHash} from 'node:crypto';
assert.equal(process.platform,'linux');assert.equal(process.env.GITHUB_ACTIONS,'true');
const exec=(bin,args)=>execFileSync(bin,args,{encoding:'utf8',maxBuffer:64e6});const run=(...a)=>exec('calcit',['calcit.cirru',...a]);
const norm=v=>Array.isArray(v)?v.map(norm):v&&typeof v==='object'?Object.fromEntries(Object.entries(v).map(([k,x])=>[k,k==='__edn_set'?x.map(norm).sort((a,b)=>JSON.stringify(a).localeCompare(JSON.stringify(b))):norm(x)])):v;
const p=norm(JSON.parse(readFileSync('reviewed.json')));const q=(...a)=>{const r=JSON.parse(run('query',...a,'--format','json'));assert.deepEqual(r.diagnostics||[],[]);return norm(r.data);};
const views=()=>({config:q('config'),namespaces:q('ns').namespaces.map(n=>q('ns',n)),defs:p.before.defs.map(d=>q('def',d.id))});const blob=()=>exec('git',['hash-object','calcit.cirru']).trim();
const hash=f=>createHash('sha256').update(readFileSync(f)).digest('hex');const ordinary=(allow=[])=>{for(const[f,h]of Object.entries(p.ordinary))if(!allow.includes(f))assert.equal(hash(f),h,f);};
function modules(dir='js-out',prefix=''){return Object.fromEntries(readdirSync(dir,{withFileTypes:true}).flatMap(e=>e.isDirectory()?Object.entries(modules(dir+'/'+e.name,prefix+e.name+'/')):[[prefix+e.name,hash(dir+'/'+e.name)]]));}
mkdirSync('acceptance',{recursive:true});const mode=process.argv[2];
if(mode==='pair'){
  assert.equal(exec('calcit',['-v']).trim(),p.baseline);ordinary();assert.equal(blob(),p.snapshotBlob);assert.deepEqual(views(),p.before);
  writeFileSync('acceptance/before.json',JSON.stringify(views()));
  const needle='(:calcit-version |'+p.baseline+')';assert.equal(p.manifests['deps.cirru'].split(needle).length,2);writeFileSync('deps.cirru',p.manifests['deps.cirru'].replace(needle,'(:calcit-version |'+p.target+')'));
  const pkg=JSON.parse(p.manifests['package.json']);assert.equal(pkg.dependencies['@calcit/procs'],p.baseline);pkg.dependencies['@calcit/procs']=p.target;writeFileSync('package.json',JSON.stringify(pkg,null,2)+'\n');
}else if(mode==='apply'){
  assert.equal(exec('calcit',['-v']).trim(),p.target);ordinary(['deps.cirru','package.json','yarn.lock']);assert.equal(blob(),p.snapshotBlob);assert.deepEqual(views(),p.before);
  writeFileSync('acceptance/target-before.json',JSON.stringify(views()));writeFileSync('acceptance/modules-before.json',JSON.stringify(modules()));writeFileSync('acceptance/server-modules-before.json',JSON.stringify(modules('.calcit/js-server')));
  const swap=q('def','calcit.core/swap!'),facade=q('def','calcit.core/dissoc');assert.deepEqual(swap.code,p.sourceProof.macroMustMatch);writeFileSync('acceptance/target-api.json',JSON.stringify({version:p.target,swap,facade}));
  const expected=structuredClone(p.before),ops=[],subtrees=[];assert.equal(p.sites.length,4);
  for(const s of p.sites){const d=expected.defs.find(d=>d.id===s.id),tree=s.path.reduce((n,i)=>n[i],d.code);assert.deepEqual(tree,s.before);assert.deepEqual(tree,['reset!',tree[1],['.dissoc','@'+tree[1],'sid']]);assert.ok(['*client-caches','*client-states'].includes(tree[1]));assert.deepEqual(s.after,['swap!',tree[1],'dissoc','sid']);const actual=JSON.parse(run('tree','show',s.id,'--path','@'+s.path.join('.'),'--format','json')).tree;assert.deepEqual(actual,tree);subtrees.push({id:s.id,path:s.path,tree:actual});tree.splice(0,tree.length,...s.after);ops.push(['tree','replace',s.id,'--path','@'+s.path.join('.'),'--input-format','json-ast','--code',JSON.stringify(s.after)]);}
  assert.deepEqual(expected,p.expected);writeFileSync('acceptance/subtrees.json',JSON.stringify(subtrees));writeFileSync('acceptance/operations.json',JSON.stringify(ops));run('docs','agents','--contract');
  const txn=['edit','transaction','--file','acceptance/operations.json','--format','json'],preview=JSON.parse(run(...txn,'--dry-run'));assert.ok(preview.scoped_revision);writeFileSync('acceptance/preview.json',JSON.stringify(preview));writeFileSync('acceptance/applied.json',run(...txn,'--expect-revision',preview.scoped_revision));assert.deepEqual(views(),p.expected);writeFileSync('acceptance/source-after.json',JSON.stringify(views()));writeFileSync('acceptance/snapshot-after-blob.txt',blob());
}else{
  assert.equal(mode,'verify');assert.equal(exec('calcit',['-v']).trim(),p.target);ordinary(['deps.cirru','package.json','yarn.lock']);assert.equal(blob(),readFileSync('acceptance/snapshot-after-blob.txt','utf8'));assert.deepEqual(views(),p.expected);
  const reports=[];for(const[dir,file]of [['js-out','modules-before.json'],['.calcit/js-server','server-modules-before.json']]){const before=JSON.parse(readFileSync('acceptance/'+file)),after=modules(dir);assert.deepEqual(Object.keys(before).sort(),Object.keys(after).sort());const changed=Object.keys(after).filter(k=>before[k]!==after[k]);for(const n of changed)assert.ok(p.allowedSourceModules.includes(n),n);reports.push({dir,before,after,changed});}writeFileSync('acceptance/source-module-diff.json',JSON.stringify(reports));writeFileSync('acceptance/after.json',JSON.stringify(views()));
  for(const[from,to]of [['calcit.cirru','snapshot.cirru'],['deps.cirru','deps.cirru'],['package.json','package.json'],['yarn.lock','yarn.lock']])writeFileSync('acceptance/'+to,readFileSync(from));writeFileSync('acceptance/success.json',JSON.stringify({base:p.base,before:p.snapshotBlob,after:blob(),definitions:218,tests:212,sourceSites:4,target:p.target}));
}
