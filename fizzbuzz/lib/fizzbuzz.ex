defmodule Fizzbuzz do
  def process(0 = rem(input, 5)), do: IO.puts "FizzBuzz"

  def process(0 = rem(input, 3)) do
    IO.puts("Fizz")
  end

  def process(0 = rem(input, 5)) do
    IO.puts("Buzz")
  end

end
