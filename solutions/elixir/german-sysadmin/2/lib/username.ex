defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    case head do
    ?ä -> ~c"ae" ++ sanitize(tail)
    ?ö -> ~c"oe" ++ sanitize(tail)
    ?ü -> ~c"ue" ++ sanitize(tail)
    ?ß -> ~c"ss" ++ sanitize(tail)
    ?_ -> [?_ | sanitize(tail)]

    _ ->
      cond do
        head in ?a..?z -> [head | sanitize(tail)]
        true -> sanitize(tail)
      end
    end
  end
end
