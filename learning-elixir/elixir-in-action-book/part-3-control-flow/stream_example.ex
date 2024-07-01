defmodule StreamExample do
  def show_list() do
    employees = ["Alice", "Bob", "John"]
    employees
    |> Stream.with_index
    |> Enum.each(
      fn {employee, index} ->
        IO.puts("#{index+1}. #{employee}")
      end
    )
  end
end
