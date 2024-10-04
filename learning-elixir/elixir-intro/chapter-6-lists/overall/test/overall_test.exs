defmodule OverallTest do
  use ExUnit.Case

  test "product" do
    assert Overall.product([1,2,3]) == 6
  end

  test "product empty list" do
    assert Overall.product([]) == 0
  end

  test "product char list" do
    assert 17472569400 == Overall.product('funny')
  end

  test "falls" do
    assert [12.181953866272849, 8.0, 19.79898987322333] == Overall.falls([{:earth, 20}, {:moon, 20}, {:mars, 20}])
  end

  test "falls []" do
    assert [] == Overall.falls([])
  end

  test "falls reverse" do
    assert [19.79898987322333, 8.0, 12.181953866272849] == Overall.falls_reverse([{:earth, 20}, {:moon, 20}, {:mars, 20}])
  end

  test "falls inverse" do
    assert [19.79898987322333, 8.0, 12.181953866272849] == Overall.falls_inverse([{:earth, 20}, {:moon, 20}, {:mars, 20}])
  end

end
