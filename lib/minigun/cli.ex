defmodule Minigun.Cli do
  @moduledoc false

  def main(argv) do
    parse_args(argv)
    |> process
  end

  def parse_args(argv) do
    parse = OptionParser.parse(
      argv,
      switches: [
        help: :boolean
      ],
      aliases: [
        h: :help
      ]
    )
    case parse do
      {[help: true], _, _} -> :help
      {_, message, _} -> message
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: minigun <message>
    """
    System.halt(0)
  end
  def process(_) do
    Minigun.run()
  end

end