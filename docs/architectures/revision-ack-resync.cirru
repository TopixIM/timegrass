{}
  :schema-version 1
  :feature 'revision-ack-resync
  :doc "|Migrate Timegrass to acknowledged revision baselines, atomic patches, bounded backpressure, typed wire envelopes, and observable final convergence."
  :roots $ #{} 'app.client/on-server-data 'app.server/run-server! 'app.server/read-sync-metrics
  :definitions $ {}
    'app.client/on-server-data $ {}
      :mode :ensure
      :kind :fn
      :doc "|Decode and apply one untrusted server message at the browser boundary."
      :params $ [] 'data
      :schema $ :: 'Fn $ {}
        :args $ [] 'Dynamic
        :return 'Unit
        :features $ #{} :js-ffi
    'app.schema/ClientMessage $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed browser-to-server synchronization and business envelope."
      :schema $ :: 'Enum
      :code $ quote
        defenum ClientMessage (:sync/active 'Number) (:sync/heartbeat 'Number) (:sync/idle 'Number) (:sync/resume 'Number) (:sync/ack 'Number) (:dispatch 'app.schema/Op)
    'app.schema/ServerMessage $ {}
      :mode :ensure
      :kind :data
      :doc "|Typed server snapshot, patch, and heartbeat envelope."
      :schema $ :: 'Enum
      :code $ quote
        defenum ServerMessage (:snapshot 'Number 'Map)
          :patch 'Number 'Number $ :: 'List 'recollect.schema/change-op
          :effect/pong
    'app.client/validate-server-patch $ {}
      :mode :ensure
      :kind :fn
      :doc "|Apply one validated patch batch only when its base revision matches the local state."
      :params $ [] 'store 'local-revision 'base-revision 'changes
      :schema $ :: 'Fn $ {}
        :args $ [] 'T 'Number 'Number (:: 'List 'recollect.schema/change-op)
        :generics $ [] 'T
        :return $ :: 'Result 'T 'app.client/ClientPatchError
    'app.server/next-sync-send-state $ {}
      :mode :ensure
      :kind :fn
      :doc "|Advance one client synchronization state from a typed transport admission outcome."
      :params $ [] 'current 'revision 'new-store 'outcome
      :schema $ :: 'Fn $ {}
        :args $ [] 'C 'Number 'U 'wss.core/WssSendOutcome
        :generics $ [] 'C 'U
        :return 'C
    'app.server/SyncMetrics $ {}
      :mode :ensure
      :kind :data
      :doc "|Process-lifetime synchronization counters with read-time client gauges."
      :schema $ :: 'Enum
      :code $ quote
        defstruct SyncMetrics (:last-diff-latency-ms 'Number) (:last-patch-bytes 'Number) (:pending-clients 'Number) (:slow-clients 'Number) (:resync-count 'Number) (:patch-attempts 'Number) (:snapshot-attempts 'Number) (:last-revision 'Number)
    'app.server/run-server! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Own the native WebSocket listener and decode typed client messages."
      :params $ [] 'port
      :schema $ :: 'Fn $ {}
        :args $ [] 'Number
        :return 'Unit
    'app.server/read-sync-metrics $ {}
      :mode :ensure
      :kind :fn
      :doc "|Read synchronization counters plus current pending and slow-client gauges."
      :params $ []
      :schema $ :: 'Fn $ {}
        :args $ []
        :return 'app.server/SyncMetrics
  :edges $ #{}
    :: :call 'app.client/on-server-data 'app.client/validate-server-patch
    :: :call 'app.server/read-sync-metrics 'app.server/SyncMetrics
