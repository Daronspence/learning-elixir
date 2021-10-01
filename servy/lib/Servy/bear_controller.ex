defmodule Servy.BearController do
  alias Servy.Conv
  alias Servy.Wildthings
  alias Servy.Bear

  @templates_path Path.expand("../../templates", __DIR__)

  defp bear_item(bear) do
    "<li>#{bear.name} - #{bear.type}</li>"
  end

  defp render(conv, template, bindings \\ []) do
    content =
      @templates_path
      |> Path.join(template)
      |> EEx.eval_file(bindings)

    %{conv | resp_body: content, status: 200}
  end

  def index(%Conv{} = conv) do
    bears =
      Wildthings.list_bears()
      # Use "capture operator" & in place of a long form anonymous function.
      # |> Enum.filter(&Bear.is_grizzly(&1))
      |> Enum.sort()

    # Reference captured anonymous function by arity.
    # |> Enum.map(&bear_item/1)
    # |> Enum.join("")

    render(conv, "index.eex", bears: bears)
  end

  def show(%Conv{} = conv, %{"id" => id}) do
    bear = Wildthings.get_bear(id)
    render(conv, "show.eex", bear: bear)
  end

  def create(conv, params) do
    %{conv | status: 201, resp_body: "Created a #{params["type"]} bear named #{params["name"]}!"}
  end
end
