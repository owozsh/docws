defmodule Transpiler.AST do
  def create() do
    {:root, nil, []}
  end

  def add_child(ast, child) do
    {type, data, children} = ast
    {type, data, [children | child]}
  end
end
