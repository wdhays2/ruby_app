class Stock
  attr_reader :ticker, :open, :high, :low, :close, :volumn, :net_change

  def initialize(ticker)
    @ticker = ticker.upcase
    _load_ticker_data
  end

  def to_s
    [@ticker, @open, @high, @low, @close, @volumn, @net_change].join(' :: ')
  end

  private

  # Yahoo CSV row columns
  # 0 :: Ticker
  # 1 :: Close
  # 2 :: Date
  # 3 :: time
  # 4 :: net chng
  # 5 :: Open
  # 6 :: High
  # 7 :: Low
  # 8 :: Volume
  def _load_ticker_data
    url = "http://download.finance.yahoo.com/d/quotes.csv?s=#{@ticker}&f=sl1d1t1c1ohgv&e=.csv"
    CSV.parse(URI.parse(url).read).each do |row|
      @open = row[5]
      @high = row[6]
      @low = row[7]
      @close = row[1]
      @volumn = row[8]
      @net_change = row[4]
    end
  end
end
