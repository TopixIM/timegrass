
= exports.get $ \ (env)
  case env
    :dev $ {}
      :env :dev
      :host :http://repo
      :port 8020
    :build $ {}
      :env :build
      :host :http://localhost
      :port 8020
