class Startup
  attr_reader :founder
  attr_accessor :name, :domain

  @@all = []

  def initialize(name, domain, founder)
    @name = name
    @domain = domain
    @founder = founder
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_founder(str)
    self.all.select {|startup| startup.founder == str}[0]
  end

  def pivot(new_name, new_domain)
    self.name = new_name
    self.domain = new_domain
  end

  def self.domains
    self.all.collect {|startups| startups.domain}
  end

  def sign_contract(vc, type, amt)
    FundingRound.new(self, vc, type, amt)
  end

  def num_founding_rounds
    FundingRound.all.select {|round| round.startup == self}.count
  end

  def investor_helper
    FundingRound.all.select {|fr| fr.startup == self}
  end

  def investors
    investor_helper.collect {|vc| vc.venture_capitalist.name}
  end

  def big_investors
    investor_helper.select {|vc| vc.venture_capitalist.total_worth >= 1000000000}.collect {|vc| vc.venture_capitalist.name}
  end

  def total_funds
    investor_helper.collect {|vc| vc.investment}.reduce(0) {|total, amt| total + amt}
  end

end
