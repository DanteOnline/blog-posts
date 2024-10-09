defmodule Bounce do

  def report(output_module \\ IO, count \\ 0) do
    new_count = receive do
      msg -> output_module.puts("Received #{count}: #{msg}")
      count + 1
    end
    report(output_module, new_count)
  end

end
