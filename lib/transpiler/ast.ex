defmodule Transpiler.AST do
  def create() do
    {:root, nil, []}
  end

  def add_child({type, data, children}, child) do
    {type, data, [children | child]}
  end
end
