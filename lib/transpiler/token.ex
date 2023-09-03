defmodule Transpiler.Token do
  def is_token?(char) do
    char in (tokens() |> Map.keys())
  end

  def tokens() do
    %{"#" => :title, "-" => :list, "*" => :bold, "_" => :italic}
  end

  def from_char(char) do
    cond do
      is_token?(char) -> tokens() |> Map.get(char)
      true -> nil
    end
  end
end
