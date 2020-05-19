require "pry"

class Startup
  attr_reader :founder
  attr_accessor :domain, :name
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(new_domain, new_name)
    @new_domain = new_domain
    @new_name = new_name
  end

  def self.find_by_founder(name)
    self.all.find do |startup|
      # binding.pry
      startup.founder == name
    end
  end

  def self.domains
    dm = self.all.map { |startup| startup.domain }
    dm.uniq
  end

  def sign_contract(vc, inv_type, invested)
    FundingRound.new(self, vc, inv_type, invested)
  end

  def num_found_rounds
    FundingRound.all.select { |round| round.startup == self }
  end.size

  def total_funds
    num_found_rounds.reduce(0) { |memo, n| memo + n.investment }
  end

  def investors
    iv = num_found_rounds.map { |vt| vt.venture_capitalist }
    iv.uniq
  end

  def big_investors
    investors.select do |vt|
      vt.total_worth > 1_000_000_000
    end
  end

  
end
