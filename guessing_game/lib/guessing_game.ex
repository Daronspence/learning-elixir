defmodule GuessingGame do
  def ask_for_name do
    IO.gets("What is your name? ")
    |> String.trim()
    |> response
    |> IO.puts()
  end

  def response("daron" = _name) do
    "Hey, that's my name!"
  end

  def response(name), do: "Nice to meet you #{name}"

  def number_game do
    bounds = %{low: 1, high: 100}
    IO.gets "Guess a number between #{bounds.low} and #{bounds.high} [press any key to continue]"
    guess(bounds.low, bounds.high)
  end

  def guess(low, high) do
    res = IO.gets "Hmm... maybe you're thinking of #{mid(low, high)}? [bigger, smaller, yes, start over, exit] \n"
    res |> String.trim |> process_guess(low, high)
  end

  def process_guess(_guess = "yes", _, _), do: IO.puts "You win!"

  def process_guess(_guess = "bigger", low, high) do
    bigger(low, high)
  end

  def process_guess(_guess = "smaller", low, high) do
    smaller(low, high)
  end

  def process_guess(_guess = "start over", _, _) do
    IO.puts "Okay. Starting over!"
    number_game
  end

  def process_guess(_guess = "exit", _, _) do
    IO.puts "Goodbye!"
  end

  def process_guess(_guess, low, high) do
    IO.puts("I don't recognize that command. Try again.")
    guess(low, high)
  end

  def mid(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end

end

GuessingGame.number_game
