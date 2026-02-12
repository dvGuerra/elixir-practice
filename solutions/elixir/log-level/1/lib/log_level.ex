defmodule LogLevel do
  def to_label(level, legacy?) do
    log_codes = %{
      0 => %{ label: :trace, supported?: false },
      1 => %{ label: :debug, supported?: true},
      2 => %{ label: :info, supported?: true },
      3 => %{ label: :warning, supported?: true },
      4 => %{ label: :error, supported?: true },
      5 => %{ label: :fatal, supported?: false }
    }

    case {level, legacy?} do
      {0, true} -> :unknown
      {5, true} -> :unknown
      {1, _} -> :debug
      {2, _} -> :info
      {3, _} -> :warning
      {4, _} -> :error
      {0, false} -> :trace
      {5, false} -> :fatal
      _ -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label == :unknown and legacy? -> :dev1
      label == :unknown -> :dev2
      label == :error or label == :fatal -> :ops
      true -> false
    end
  end
end
