defmodule Overall do

  def product([]) do
    0
  end

  def product(list) do
    product(list, 1)
  end

  def product([], accumulated_product) do
    accumulated_product
  end

  def product([head | tail], accumulated_product) do
    product(tail, head * accumulated_product)
  end

  def falls(list) do
    falls(list, [])
  end

  def falls([], results) do
    results
  end

  def falls([{planemo, distance} | tail], results) do
    # {planemo, distance} = head
    falls(tail, [Drop.fall_velocity(planemo, distance) | results])
  end

  def falls_reverse(list) do
    falls_reverse(list, [])
  end

  def falls_reverse([], results) do
    Enum.reverse(results)
  end

  def falls_reverse([{planemo, distance} | tail], results) do
    # {planemo, distance} = head
    falls_reverse(tail, [Drop.fall_velocity(planemo, distance) | results])
  end

  def falls_inverse(list) do
    falls(Enum.reverse(list), [])
  end

end
