defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    Float.round((hourly_rate * 8) * 1.0, 1)
  end

  def apply_discount(before_discount, discount) do
    with_discount = before_discount * (discount / 100)
    
    before_discount - with_discount
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate = hourly_rate * 8  
    monthly_rate = daily_rate * 22
    
    result = apply_discount(monthly_rate, discount) |> Float.ceil |> trunc
    IO.puts(result)
    result
  end


  def days_in_budget(budget, hourly_rate, discount) do
    result = daily_rate(hourly_rate) |> apply_discount(discount)
    Float.floor(budget / result, 1)
  end
end
