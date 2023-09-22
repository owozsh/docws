defmodule Transpiler.Lexer do
  alias Transpiler.AST
  alias Transpiler.Token

  defguardp is_whitespace(c) when c in ~c[ \n\t]
  defguardp is_letter_or_digit(c) when c in ?a..?z or c in ?A..?Z or c == ?_ or c in ?0..?9

  @type token ::
          :title
          | :list
          | :bold
          | :italic

  @type ast :: {token, map, list}

  @spec scan(String.t()) :: ast
  def scan(input)

  def scan(input) when is_binary(input) do
    ast = AST.create()
    lex(input, ast)
  end

  @spec lex(String.t(), ast) :: ast
  defp lex(<<>>, {token, data, ast_children}) do
    children = ast_children |> Enum.reverse()
    {token, data, children}
  end

  defp lex(<<c::8, rest::binary>>, ast) when is_whitespace(c) do
    lex(rest, ast)
  end

  defp lex(input, ast) do
    {ast_node, rest} = tokenize(input, ast)
    new_ast = AST.add_child(ast, ast_node)
    lex(rest, new_ast)
  end

  # tokenize should store ast to get a type content

  @spec tokenize(input :: String.t(), ast) :: {ast, rest :: String.t()}
  defp tokenize(<<"#", rest::binary>>, ast) do
    title_node = AST.create_node(:title, nil, [])
    new_ast = ast |> AST.add_child(title_node)
    {new_ast, rest}
  end

  defp tokenize(<<"-", rest::binary>>, ast) do
    # [] should store the list content
    {AST.create_node(:list, nil, []), rest}
  end

  defp tokenize(<<"\t-", rest::binary>>, ast) do
  end
end
