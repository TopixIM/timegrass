{}
  :schema-version 1
  :feature 'client-connection-recovery
  :doc "|Typed browser recovery over ws-edn generations while the legacy Timegrass patch protocol converges by rebuilding the client cache after login."
  :roots $ #{} 'app.client/recover-connection!
  :definitions $ {}
    'app.client/ConnectionRecoveryAction $ {}
      :mode :ensure
      :kind :data
      :doc "|Deterministic browser recovery choice."
      :schema $ :: 'EnumDef
      :code $ quote $ defenum ConnectionRecoveryAction (:none) (:reconnect) (:connect)
    'app.client/*connected? $ {}
      :mode :ensure
      :kind :data
      :doc "|Whether the active ws-edn generation is open."
      :schema $ :: 'Ref 'Bool
      :code $ quote $ defatom *connected? false
    'app.client/*ws-client $ {}
      :mode :ensure
      :kind :data
      :doc "|Current nominal ws-edn client retained across browser recovery events."
      :schema $ :: 'Ref (:: 'Option 'ws-edn.client/WsClient)
      :code $ quote $ defatom *ws-client $ %none
    'app.client/choose-recovery-action $ {}
      :mode :ensure
      :kind :fn
      :doc "|Choose whether a visible online page should reconnect or create a client."
      :params $ [] 'connected? 'has-client? 'visible? 'online?
      :schema $ :: :fn $ {}
        :args $ [] 'Bool 'Bool 'Bool 'Bool
        :return 'ConnectionRecoveryAction
    'app.client/recover-connection! $ {}
      :mode :ensure
      :kind :fn
      :doc "|Apply the typed browser recovery policy to the retained ws-edn client."
      :params $ []
      :schema $ :: :fn $ {}
        :args $ []
        :return 'Unit
        :features $ #{} :js-ffi
  :edges $ #{}
    :: :call 'app.client/recover-connection! 'app.client/choose-recovery-action
