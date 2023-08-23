defmodule Transpiler.Parser do
  def parse_file(content, out_dir) do
    transpiled_file =
      content
      |> String.split("\n")
      |> Enum.map(fn line -> parse_line(line) end)
      |> Enum.join()

    File.write!(out_dir, transpiled_file)
  end

  defp parse_line(line) do
    "parsed:" <> line <> "\n"
  end
end
