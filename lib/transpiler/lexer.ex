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
    [token_char | next] = chars
    token = Token.from_char(token_char)

    case token do
      :title -> scan_token(token, ast, chars)
      :list -> scan_token(token, ast, chars)
      _ -> scan(ast, next)
    end
  end

  def scan_token(:title, ast, chars) do
    [_ | chars_wo_token] = chars

    [title_text | next] =
      chars_wo_token
      |> Enum.join()
      |> String.split("\n")

    text_node = AST.create_node(:text, String.trim(title_text), [])

    child =
      AST.create_node(:title, nil, [])
      |> AST.add_child(text_node)

    AST.add_child(ast, child)
    |> scan(String.graphemes(Enum.join(next)))
  end

  def scan_token(:list, ast, chars) do
    [_ | chars_wo_token] = chars

    [list_text | next] =
      chars_wo_token
      |> Enum.join()
      |> String.split("\n")

    list_node = AST.create_node(:list, String.trim(list_text), [])

    child = AST.create_node(:list, nil, []) |> AST.add_child(list_node)

    IO.puts(next)

    AST.add_child(ast, child)
    |> scan(String.graphemes(Enum.join(next)))
  end
end
