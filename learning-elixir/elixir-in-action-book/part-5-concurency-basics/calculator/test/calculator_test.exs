defmodule CalculatorTest do
  use ExUnit.Case

  defp calculator(), do: Calculator.start()

  test "test start" do
    assert is_pid(calculator())
  end

  test "start value" do
    calculator_pid = calculator()
    assert 0 == Calculator.value(calculator_pid)
  end

  test "calculate" do
    calculator_pid = calculator()
    Calculator.add(calculator_pid, 5)
    assert 5 == Calculator.value(calculator_pid)
    Calculator.sub(calculator_pid, 2)
    assert 3 == Calculator.value(calculator_pid)
    Calculator.mul(calculator_pid, 4)
    assert 12 == Calculator.value(calculator_pid)
    Calculator.div(calculator_pid, 6)
    assert 2 == Calculator.value(calculator_pid)
  end
end
