defmodule CombinedTest do
  use ExUnit.Case

  test "height_to_mph" do
    assert 44.289078952755766 == Combined.height_to_mph(20)
    assert Combined.height_to_mph_pipe(20) == Combined.height_to_mph(20)
    assert CombinedImport.height_to_mph_pipe(20) == Combined.height_to_mph_pipe(20)
  end

  test "with gravity" do
    assert 14.14762731417387 == Combined.height_to_mph(20, 1)
  end
end
