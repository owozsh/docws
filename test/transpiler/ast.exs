defmodule ASTTest do
  use ExUnit.Case
  alias Transpiler.AST

  doctest Transpiler.AST

  test "add child to node" do
    node = AST.create()
    {initial_type, initial_data, initial_children} = node

    child_to_be_added = AST.create_node(:text, "Testing", [])

    {type, data, children} = node |> AST.add_child(child_to_be_added)

    assert initial_type == type
    assert initial_data == data
    assert children == [initial_children | child_to_be_added]
  end
end
