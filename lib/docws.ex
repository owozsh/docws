defmodule Docws do
  def gen_html(path, out_dir) do
    case File.read(path) do
      {:ok, content} -> parse_file(content, out_dir)
      {:error, e} -> IO.puts(e)
    end
  end

  defp parse_file(content, out_dir) do
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
