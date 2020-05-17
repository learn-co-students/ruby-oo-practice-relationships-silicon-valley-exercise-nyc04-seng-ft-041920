class VentureCapitalist
  attr_reader :name, :total_worth

  @@all = []

  def initialize name, total_worth
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select { |vc_instance| vc_instance.total_worth >= 1000000000}
  end

  def offer_contract start_up, type, investment
  # given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    funding_round_ins = FundingRound.new(start_up, self, type, investment)
    funding_round_ins
  end

  def funding_rounds
  # returns an array of all funding rounds for that venture capitalist
    FundingRound.all.select { |funding_ins| funding_ins.vc == self }
    # binding.pry
  end

  def portfolio
  # Returns a unique list of all startups this venture capitalist has funded
    self.funding_rounds.collect { |funding_ins| funding_ins.start_up }.uniq
  end

  def biggest_investment
  # returns the largest funding round given by this venture capitalist
  biggest_invest = nil
    self.funding_rounds.each do |funding_ins|
      highest_temp_amount = self.funding_rounds[0].investment
      if funding_ins.investment >= highest_temp_amount
        highest_temp_amount = funding_ins
      end
      biggest_invest = highest_temp_amount
    end
    biggest_invest
  end

  def invested domain_str
  # given a domain string, returns the total amount invested in that domain
    self.funding_rounds.reduce(0) do |accum, funding_ins|
      if funding_ins.start_up.domain == domain_str
        accum += funding_ins.investment
      end
      accum
    end
  end

end
