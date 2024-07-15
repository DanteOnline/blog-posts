defmodule FractionTest do
  use ExUnit.Case

  test "structure" do
    fraction = %Fraction{a: 1, b: 2}
    assert fraction.a == 1
    assert fraction.b == 2
  end

  test "new" do
    Fraction.new(1, 2) == %Fraction{a: 1, b: 2}
  end

  test "value" do
    assert Fraction.new(1, 2)
    |> Fraction.value() == 1/2
  end

  test "add" do
    assert Fraction.add(Fraction.new(1, 2), Fraction.new(1, 4))
    |> Fraction.value == 0.75
  end
end
