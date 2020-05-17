require 'pry'
class Startup
  attr_reader :name, :founder, :domain

  @@all = []

  def initialize name_input, founder_input, domain_input
    @name = name_input
    @founder = founder_input
    @domain = domain_input
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_founder founder_name
    # binding.pry
    self.all.find do |startup_instance|
      founder_name == startup_instance.founder
    end
  end

  def self.domains
    # binding.pry
    self.all.collect { |startup_instance| startup_instance.domain}
  end

  def sign_contract vc, type, investment
    funding_round_ins = FundingRound.new self, vc, type, investment
    funding_round_ins
  end

  def num_funding_rounds
    # Returns the total number of funding rounds that the startup has gotten
    # binding.pry
    FundingRound.all.select { |funding_ins| funding_ins.start_up == self }.count
  end

  def total_funds
    # Returns the total sum of investments that the startup has gotten
    FundingRound.all.reduce(0) do |accum, funding_inst|
      if funding_inst.start_up == self
        accum += funding_inst.investment
      end
      accum
      # BELOW is another way to this logic using the ternary operator (condition ? true : false)
      # funding_inst.start_up == self ? accum += funding_inst.investment : accum += 0
    end
    # binding.pry
  end

  def investors
    # Returns a unique array of all the venture capitalists that have invested in this company
    funding_rounds = FundingRound.all.select { |funding_ins| funding_ins.start_up == self }
    funding_rounds.collect { |funding_ins| funding_ins.vc }.uniq
    # binding.pry
  end

  def big_investors
    # Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
    self.investors.select { |vc_instance| vc_instance.total_worth >= 1000000000}

  end

  def pivot new_domain, new_name
    @name = new_name
    @domain = new_domain
  end



end
