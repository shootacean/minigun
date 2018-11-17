defmodule Minigun do
  @moduledoc """
  Documentation for Minigun.
  """

  require Logger
  require HTTPoison
  require Poison

  def run do
    Logger.info "Minigun start!"

    result = "aim.json"
             |> File.stream!
             |> Flow.from_enumerable
             |> Flow.map(fn d -> Poison.decode!(d) end)
             |> Flow.partition
             |> Flow.map(
                  fn d ->
                    shoot(d["url"])
                  end
                )
    result
    |> Enum.map(fn d -> memo(d[:status], d[:url]) end)

    Logger.info "Minigun end!"
  end

  def shoot(url) do
    case HTTPoison.get(url) do
      {:ok, response} ->
        [status: response.status_code, url: url]
      {:error, error} ->
        [status: error.id, url: error.reason]
    end
  end

  defp memo(200, url), do: Logger.info "ok! #{url}"
  defp memo(404, url), do: Logger.error "404! #{url}"
  defp memo(status, url), do: Logger.warn "other status! #{status} : #{url}"

end
