defmodule FunctionMaker do

  defmacro create_multiplier(function_name, factor) do
    quote do
      def unquote(function_name)(value) do
        unquote(factor) * value
      end
    end
  end

  defmacro create_functions(planemo_list) do
    Enum.map(
      planemo_list,
      fn {name, gravity} ->
        quote do
          def unquote(:"#{name}_drop")(distance) do
            :math.sqrt(2 * unquote(gravity)*distance)
          end
        end
      end
    )
  end

end
