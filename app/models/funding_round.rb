# FundingRound#startup
# returns the startup object for that given funding round
# Once a funding round is created, I should not be able to change the startup
#
# FundingRound#venture_capitalist
# returns the venture capitalist object for that given funding round
# Once a funding round is created, I should not be able to change the venture capitalist

# FundingRound#type
# returns a string that is the type of funding round
# Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.

# FundingRound#investment
# returns a number that is the amount invested during this funding round
# This should be a float that is not a negative number.

# FundingRound.all
# returns all of the funding rounds
class FundingRound
  attr_reader :start_up, :vc, :investment
  attr_accessor :type

  @@all = []

  def initialize startup_input, vc_input, type_input, investment_input
    @start_up = startup_input
    @vc = vc_input
    @type = type_input
    @investment = investment_input
    @@all << self
  end

  def self.all
    @@all
  end


end
