defmodule MinigunTest do
  use ExUnit.Case
  doctest Minigun

  test "check http status" do
    url = "https://github.com/shootacean"
    assert Minigun.shoot(url) == [status: 200, url: url]
    url = "https://github.com/shootacean/notfound"
    assert Minigun.shoot(url) == [status: 404, url: url]
  end

end
