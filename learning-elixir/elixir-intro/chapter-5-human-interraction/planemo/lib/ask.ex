defmodule Ask do

  def char_to_planemo(1), do: :earth
  def char_to_planemo(2), do: :moon
  def char_to_planemo(3), do: :mars

  def main(io_module \\ IO) do
    io_module.puts("""
      Which planemo are you on?
      1. Earth
      2. Moon
      3. Mars
      """)
    planemo_input = io_module.gets("Which? > ")
    distanse_input = io_module.gets("How far? (meters) > ")

    planemo_number = get_planemo_number(planemo_input)
    planemo = char_to_planemo(planemo_number)
    distance = get_distance(distanse_input)
    Drop.fall_velocity(planemo, distance)
  end

  def get_distance(distance_input) do
    distance_input
    |> String.trim
    |> String.to_integer
  end

  def use_gets(io_module \\ IO) do
    io_module.gets("Make some input > ")
  end

  def chars(io_module \\ IO) do
    io_module.puts("""
    Which planemo are you on?
    1. Earth
    2. Moon
    3. Mars
    """)
    answer = io_module.gets("Which? > ")
    value = String.first(answer)
    value = String.to_integer(value)
    char_to_planemo(value)
  end

  def get_planemo_number(input_str) do
    input_str
    |> String.first
    |> String.to_integer
  end

end
