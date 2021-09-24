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
