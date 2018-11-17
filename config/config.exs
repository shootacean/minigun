use Mix.Config

config :logger,
       backends: [
         {LoggerFileBackend, :info},
         {LoggerFileBackend, :warn},
         {LoggerFileBackend, :error}
       ]

config :logger,
       :info,
       path: "./logs/info.log",
       level: :info

config :logger,
       :warn,
       path: "./logs/warn.log",
       level: :warn

config :logger,
       :error,
       path: "./logs/error.log",
       level: :error