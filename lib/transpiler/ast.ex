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

  def print({type, _, children}, indent \\ "") do
    IO.puts("#{indent}#{type}")
    for child <- children do
      print(child, indent <> "| ")
    end
  end
end
