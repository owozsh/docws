defmodule Transpiler.Token do
  def is_token?(char) do
    char in (tokens() |> Map.keys())
  end

  def tokens() do
    %{"#" => :title, "-" => :list, "*" => :bold, "_" => :italic}
  end

  def from_char(char) do
    tokens() |> Map.get(char)
  end
end
