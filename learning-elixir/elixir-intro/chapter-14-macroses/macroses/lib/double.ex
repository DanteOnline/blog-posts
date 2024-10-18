defmodule Double do

  defmacro double x do
    {:*, [], [2, x]}
  end

  defmacro simple_double x do
    quote do: 2 * unquote(x)
  end

end
