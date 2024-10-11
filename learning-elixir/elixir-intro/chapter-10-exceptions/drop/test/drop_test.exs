defmodule DropTest do
  use ExUnit.Case

  test "drop" do
    assert 19.79898987322333 == Drop.fall_velocity(:earth, 20)
    assert %ArithmeticError{message: "bad argument in arithmetic expression"} == Drop.fall_velocity(:earth, -20)
    assert %CaseClauseError{term: :jupiter} == Drop.fall_velocity(:jupiter, 20)
  end

  test "drop rescue" do
    assert 19.79898987322333 == Drop.fall_velocity_rescue(:earth, 20)
    assert{:error,"Distance must be non-negative"} == Drop.fall_velocity_rescue(:earth, -20)
    assert {:error,"Unknown planemo jupiter"} == Drop.fall_velocity_rescue(:jupiter, 20)
  end
end
