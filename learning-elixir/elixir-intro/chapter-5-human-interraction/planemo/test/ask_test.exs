defmodule IOMock do
  def gets(_), do: "256"

  def puts(_), do: nil
end

defmodule AskTest do
  use ExUnit.Case
  import Mox

  setup :verify_on_exit!

  test "use gets" do
    IOBehaviourMock
    |> expect(:gets, fn _prompt -> "Alice" end)

    result = Ask.use_gets(IOBehaviourMock)
    assert result == "Alice"

    result = Ask.use_gets(IOMock)
    assert result == "256"
  end

  test "chars" do
    result = Ask.chars(IOMock)
    assert :moon == result
  end

  test "char to planemo" do
    assert :earth == Ask.char_to_planemo(1)
    assert :moon == Ask.char_to_planemo(2)
    assert :mars == Ask.char_to_planemo(3)
  end

  test "get_planemo_number" do
    assert 2 == Ask.get_planemo_number("2 some words")
  end

  test "get_distance" do
    assert 256 == Ask.get_distance("256")
  end

  test "main" do
    assert 28.621670111997307 == Ask.main(IOMock)
  end
end
