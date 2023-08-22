defmodule Docws do
  def gen_html(path) do
    case File.read(path) do
      {:ok, content} -> parse(content)
      {:error, e} -> IO.puts(e)
    end
  end

  defp parse(content) do
    IO.puts(content)
  end
end
