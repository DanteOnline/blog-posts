defmodule FilePracticeTest do
  use ExUnit.Case

  test "test line_lengths!/1" do
    assert FilePractice.line_lengths!("test_file.txt") == 3
  end

  test "test longest_line_length!/1" do
    assert FilePractice.longest_line_length!("test_file.txt") == 13
  end

  test "words per line" do
    assert FilePractice.words_per_line!("test_file.txt") == [2, 3, 1]
  end
end
