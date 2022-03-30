# frozen_string_literal: true

def stock_picker(stock_prices)
  profit, day_to_buy, day_to_sell = 0

  stock_prices.each_with_index do |price, buy_day|
    highest_price = highest_price_after_buy_day(stock_prices, buy_day)

    next unless profit < highest_price - price

    profit = highest_price - price
    day_to_sell = stock_prices.index(highest_price)
    day_to_buy = buy_day
  end

  [day_to_buy, day_to_sell]
end

def highest_price_after_buy_day(stock_prices, buy_day)
  stock_prices.slice(buy_day, stock_prices.length).reduce do |highest, number|
    highest > number ? highest : number
  end
end
