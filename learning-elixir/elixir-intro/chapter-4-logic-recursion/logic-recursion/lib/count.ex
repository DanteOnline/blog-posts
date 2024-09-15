defmodule Count do
  def countdown(0), do: IO.puts('Blastoff!')

  def countdown(n) do
    IO.puts(n)
    countdown(n - 1)
  end

  def countup(limit) do
    countup(1, limit)
  end

  # defp countup(count, limit) when count == limit do
  #   IO.puts("Finished")
  # end

  defp countup(limit, limit) do
    IO.puts("Finished")
  end

  defp countup(count, limit) do
    IO.puts(count)
    countup(count+1, limit)
  end

  def factorial(1), do: 1

  def factorial(n), do: factorial(n-1)*n

end
