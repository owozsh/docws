defmodule Transpiler.Lexer do
  alias Transpiler.Token

  @type ast :: {atom, map, list}

  @spec scan(ast, list, integer) :: {ast, list, integer}
  def scan(ast, chars, pos)

  def scan(ast, chars, pos) when length(chars) == pos do
    ast
  end

  def scan(ast, chars, pos) do
    for char <- chars do
      token = Token.from_char(char)
    end
  end
end
