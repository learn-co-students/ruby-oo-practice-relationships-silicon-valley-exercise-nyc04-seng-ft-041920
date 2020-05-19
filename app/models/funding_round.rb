class FundingRound
  attr_reader :startup, :venture_capitalist, :investment
  attr_accessor :type
  @@all = []

  def self.all
    @@all
  end

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment.abs
    @@all << self
  end
end
