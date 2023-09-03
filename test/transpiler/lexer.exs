defmodule LexerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  alias Transpiler.AST
  alias Transpiler.Lexer

  doctest Transpiler.Lexer

  test "should return an AST with a title node" do
    ast = AST.create()

    char_list = String.graphemes("# Testing\nabc")

    final_ast = Lexer.scan_token(:title, ast, char_list)

    ast_string = "root\n| title\n| | text :: Testing\n"

    AST.print(final_ast)

    is_tree_correct? =
      capture_io(fn -> AST.print(final_ast) end)
      |> String.equivalent?(ast_string)

    assert is_tree_correct?
  end
end
