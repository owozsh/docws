defmodule Docws do
  alias Transpiler.Parser

  def gen_html(path, out_dir) do
    case File.read(path) do
      {:ok, content} -> Parser.parse_file(content, out_dir)
      {:error, e} -> IO.puts(e)
    end
  end
end
