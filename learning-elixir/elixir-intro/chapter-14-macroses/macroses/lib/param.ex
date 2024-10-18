defmodule Param do
  defmacro param_test(name, param_list, function) do

    param_list
    |> Enum.with_index()
    |> Enum.map(
      fn {params, i} ->

        quote do
          IO.puts("#{unquote(i)}")
          test "#{unquote(name)}_#{unquote(i)}" do
             apply(unquote(function), Tuple.to_list(unquote((params))))
          end

        end

      end
    )

  end
end
