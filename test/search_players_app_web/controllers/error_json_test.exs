defmodule SearchPlayersAppWeb.ErrorJSONTest do
  use SearchPlayersAppWeb.ConnCase, async: true

  test "renders 404" do
    assert SearchPlayersAppWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert SearchPlayersAppWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
