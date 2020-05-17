class VentureCapitalist
  attr_accessor :name, :total_worth
  @@all = []
  # - Returns a **string** that is the venture capitalist's name
  # `VentureCapitalist#total_worth`
  # - Returns a **number** that is the total worth of this investor 
  # (e.g., think of it as how much money they have)
  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth

    @@all << self
  end

  # - Returns an array of all venture capitalists in the 
  # Trés Commas club (they have more then 1,000,000,000 `total_worth`)
  def self.tres_commas_club
    @@all.find_all do |find_it|
      find_it.total_worth > 1000000000
    end
  end

  # - Returns an array of all venture capitalists
  def self.all
    @@all
  end

  # (startup, venture_capitalist, type, investment=0.0)
  # - Given a **startup object**, type of investment (as a string), 
  # and the amount invested (as a float), creates a new funding round 
  # and associates it with that startup and venture capitalist.
  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  # - Returns an array of all funding rounds for that venture capitalist
  def funding_rounds
    FundingRound.all.find_all do |find_it|
      find_it.venture_capitalist == self
    end
  end

  # - Returns a **unique** list of all startups this venture capitalist has funded
  def portfolio
    portfolio = []
    funding_rounds.map do |find_it|
      if find_it.venture_capitalist.name == self.name
        portfolio << find_it.startup
      end
    end
    portfolio
  end
  
  # - Returns the largest funding round given by this venture capitalist
  def biggest_investment
    biggest_invesment = funding_rounds[0].investment
    funding_rounds.map do |find_it|
      if find_it.investment > biggest_invesment
        biggest_invesment = find_it.investment
      end
    end
    biggest_invesment
  end

  # - Given a **domain string**, returns the total amount invested in that domain
  def invested(domain)
    funding_rounds.reduce(0) { |sum, value| value.startup.domain == domain ? sum + value.investment : sum}
  end

end
