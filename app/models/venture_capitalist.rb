require ("pry")

class VentureCapitalist
  attr_reader :name, :total_worth
  # attr_accessor
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select { |vt| vt.total_worth > 1000000000 }
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def founding_rounds
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def portfolio
    founding_rounds.map { |str| str.startup }.uniq
  end

  def biggest_investment
    founding_rounds.max_by { |round| round.investment }
  end

  def invested(domain)
    total = 0
    founding_rounds.map do |round|
      # binding.pry
      if round.startup.domain == domain
        total += round.investment
      end
    end
    total
  end
end
