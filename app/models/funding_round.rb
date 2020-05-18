class FundingRound
  attr_accessor :type
  attr_reader :startup, :venture_capitalist, :investment
  @@all = []

  # - Returns the startup object for that given funding round
  # - Once a funding round is created, I should not be able to change the startup
  # - returns the venture capitalist object for that given funding round
  # - Once a funding round is created, I should not be able to change the venture capitalist
  # - Returns a **string** that is the type of funding round
  # - Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
  # - Returns a **number** that is the amount invested during this funding round
  # - This should be a float that is not a negative number.
  def initialize(startup, venture_capitalist, type, investment=0.0)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment

    @@all << self
  end

  # - Returns all of the funding rounds
  def self.all
    @@all
  end
end
