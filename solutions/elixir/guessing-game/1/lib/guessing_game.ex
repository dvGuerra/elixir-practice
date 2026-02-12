defmodule GuessingGame do
  def compare(secret_number, guess)
      when is_integer(secret_number) and is_integer(guess) do
    cond do
      secret_number == guess ->
        "Correct"

      abs(secret_number - guess) == 1 ->
        "So close"

      guess > secret_number ->
        "Too high"

      guess < secret_number ->
        "Too low"
    end
  end
  def compare(_secret_number), do: "Make a guess"
  def compare(_, _), do: "Make a guess"
  
  
end
