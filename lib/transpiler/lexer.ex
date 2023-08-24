defmodule Transpiler.Lexer do
  def scan_file(content, out_dir) do
    transpiled_file =
      content
      |> Enum.map(fn line -> scan_line(line) end)
      |> Enum.join()

    File.write!(out_dir, transpiled_file)
  end

  defp scan_line(line) do
    "parsed:" <> line <> "\n"
  end

  defp scan_char(char) do
    case char do
      "#" -> :title
      "-" -> :list
      "*" -> :bold
      "_" -> :italic
      _ -> char
    end
  end

  defp scan_title(node) do
  end
end
