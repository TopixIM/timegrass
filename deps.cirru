
{} (:calcit-version |0.12.59)
  :dependencies $ {} (|Cumulo/cumulo-reel.calcit |0.0.21)
    |Cumulo/cumulo-util.calcit |main
    |Respo/alerts.calcit |0.10.14
    |Respo/respo-feather.calcit |0.4.1
    |Respo/respo-markdown.calcit |0.4.20
    |Respo/respo-message.calcit |0.0.10
    |Respo/respo-ui.calcit |0.7.0
    |Respo/respo.calcit |0.16.60
    |calcit-lang/calcit-wss |0.2.10
    |calcit-lang/calcit.std |0.2.14
    |calcit-lang/lilac |0.5.1
    |calcit-lang/memof |0.0.26
    ; 0.0.20+ has an upstream schema bug that blocks JS codegen on Calcit 0.12.59.
    ; Keep the latest known-good release until https://github.com/calcit-lang/recollect/issues/25 is fixed.
    |calcit-lang/recollect |0.0.19
    |mvc-works/ws-edn.calcit |0.0.13
