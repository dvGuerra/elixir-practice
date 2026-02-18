defmodule Username do
  def sanitize([]), do: []
  
  def sanitize([?ä | tail]), do: ~c"ae" ++ sanitize(tail)
  def sanitize([?ö | tail]), do: ~c"oe" ++ sanitize(tail)
  def sanitize([?ü | tail]), do: ~c"ue" ++ sanitize(tail)
  def sanitize([?ß | tail]), do: ~c"ss" ++ sanitize(tail)
  def sanitize([head | tail]) when head in ?a..?z do
    [head | sanitize(tail)]
  end
  
  def sanitize([?_ = head | tail]) do
    [head | sanitize(tail)]
  end
  
  def sanitize([_head | tail]) do
    sanitize(tail)
  end
end
