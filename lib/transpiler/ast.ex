defmodule Transpiler.AST do
  def create() do
    {:root, nil, []}
  end

  def create_node(token, meta, children) do
    {token, meta, children}
  end

  def add_child({type, data, children}, child) do
    {type, data, [child | children]}
  end

  def print({type, data, children}, indent \\ "") do
    print_node({type, data}, indent)

    for child <- children do
      print(child, indent <> "| ")
    end
  end

  defp print_node({type, data}, indent) when is_binary(data) do
    IO.puts("#{indent}#{type} :: #{data}")
  end

  defp print_node({type, _}, indent) do
    IO.puts("#{indent}#{type}")
  end
end
