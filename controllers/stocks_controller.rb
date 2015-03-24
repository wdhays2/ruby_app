class StocksController < BaseController
  def self.load_ticker(ticker)
    stock = Stock.new(ticker)
    _log('stocks', stock.to_s)
    stock
  end
end
