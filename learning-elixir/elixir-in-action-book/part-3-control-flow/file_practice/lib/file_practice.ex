defmodule FilePractice do

  defp replace_end(str) do
    String.replace(str, "\n", "")
  end

  defp file_to_stream(path) do
    File.stream!(path)
    |> Stream.map(&replace_end/1)
  end


  def line_lengths!(path) do
    file_to_stream(path)
    |> Enum.count
  end

  def longest_lint(path) do
    file_to_stream(path)
    |> Enum.max_by(
      &String.length/1
    )
  end

  def longest_line_length!(path) do
    longest_lint(path)
    |> String.length
  end

  def words_per_line!(path) do
    file_to_stream(path)
    |> Enum.map(
      &(
        String.split(&1)
        |> Enum.count
        )
    )
  end

end
