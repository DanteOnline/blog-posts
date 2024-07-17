defmodule TodoList.CsvImporter do

  defp replace_end(str) do
    String.replace(str, "\n", "")
  end

  defp file_to_stream(path) do
    File.stream!(path)
    |> Stream.map(&replace_end/1)
  end

  defp create_entry(entry_str) do
    [date_str, title] = String.split(entry_str, ",")
    [year, month, day] = String.split(date_str, "/")
    |> Enum.map(&String.to_integer/1)
    date = %Date{year: year, month: month, day: day}
    %{date: date, title: title}
  end

  def import(filename) do
    entries = file_to_stream(filename)
    |> Stream.map(
      &create_entry/1
    )
    TodoList.new(entries)
  end

end
