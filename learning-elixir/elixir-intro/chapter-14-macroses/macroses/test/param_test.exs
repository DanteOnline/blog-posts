defmodule ParamTest do
  use ExUnit.Case
  require Param

  test "simple test 2" do
    a = 2
    b = 3
    assert 5 == a + b
  end

  test "simple test 3" do
    a = 2
    b = 3
    c = 4
    assert 20 == (a + b) * c
  end

  def test_simple_2(a, b, result) do
    assert a + b == result
  end

  Param.param_test "param test 2", [{1, 2, 3}, {2, 3, 5}, {1, 1, 2}], &ParamTest.test_simple_2(&1, &2, &3)
  Param.param_test "param test 2 math", [{1, 2, 3}, {2, 3, 5}, {1, 1, 2}], &(assert &1 + &2 == &3)

  Param.param_test(
    "param test 2 lambda",
    [{1, 2, 3}, {2, 3, 5}, {1, 1, 2}],
    fn a,b,result -> assert a + b == result end
  )

  Param.param_test "param test 3", [{1,2,3,9}], &(assert &4 == (&1+&2)*&3)


end
