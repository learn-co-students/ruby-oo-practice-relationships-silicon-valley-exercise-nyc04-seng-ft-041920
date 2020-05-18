class VentureCapitalist
  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth=0)
    @name = name
    @total_worth = total_worth
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select {|billionaire| billionaire.total_worth >= 1000000000}
  end

  def offer_contract(startup, type, amt)
    FundingRound.new(startup, self, type, amt)
  end

  def funding_rounds
    FundingRound.all.select {|round| round.venture_capitalist == self}.count
  end

  def vc_helper
    FundingRound.all.select {|fr| fr.venture_capitalist == self}
  end

  def portfolio
    vc_helper.collect {|vc| vc.startup.name}.uniq
  end

  def biggest_investment
    vc_helper.collect {|vc| vc.investment}..max {|a, b| a <=> b}
  end

  def invested(str)
    # this is so ugly and i don't care
    # no i do actually
    # don't judge me
    FundingRound.all.select {|fr| fr.venture_capitalist == self && fr.startup.domain == str}.reduce(0) {|total, sum| total + sum.investment}
  end

end
