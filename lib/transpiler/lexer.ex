defmodule Transpiler.Lexer do
  alias Transpiler.AST
  alias Transpiler.Token

  @type ast :: {atom, map, list}

  @spec scan(ast, list) :: {ast, list}
  def scan(ast, chars)

  def scan(ast, chars) when length(chars) == 0 do
    ast
  end

  def scan(ast, chars) do
    token = Token.from_char(chars[0])

    case token do
      :title -> scan_token(token, ast, chars)
    end
  end

  def scan_token(:title, ast, chars) do
    [title_text, _] =
      chars
      |> Enum.join()
      |> String.split("\n")

    child =
      AST.create_node(:title, nil, [])
      |> AST.add_child(AST.create_node(:text, title_text, []))

    [chars_wo_token, _] = chars

    AST.add_child(ast, child)
    |> scan(chars_wo_token)
  end
end
