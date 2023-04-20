def convert_currency(amount, source_currency, target_currency, conversion_rates)
  converted_amount = amount * conversion_rates[source_currency] * conversion_rates[target_currency]
  puts converted_amount.to_i
end

conversion_rates = {
  usd: 1.0,
  jpy: 110.0,
  eur: 0.8
}

convert_currency(100, :usd, :jpy, conversion_rates)
