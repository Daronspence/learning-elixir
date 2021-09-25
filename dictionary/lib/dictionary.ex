defmodule Dictionary do
  def hello do
    IO.puts("hello world!! you suck")
  end

  def random_word do
    word_list()
    |> Enum.random()
  end

  def word_list do
    "assets/words.txt"
    |> File.read!()
    |> String.split("\n")
  end
end

defmodule Patterns do
  def swap({ a, b }) do
    {b, a}
  end

  def same?({a, a}) do
    true
  end

  def same?({_a, _b}) do
    false
  end
end
