class Startup
  attr_reader :name, :founder, :domain
  @@all = []

  # - Returns a **string** that is the startup's name
  # - Returns a **string** that is the founder's name 
  # - Once a startup is created, the founder cannot be changed.
  # - Returns a **string** that is the startup's domain
  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  # - Given a string of a **domain** and a string of 
  # a **name**, change the domain and name of the startup. 
  # This is the only public method through which the
  # domain should be changed.
  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  # - Given a string of a **founder's name**, returns 
  # the **first startup** whose founder's name matches
  def self.find_by_founder(founder_name)
    @@all.find do |find_it|
      find_it.founder == founder_name
    end
  end

  # - Should return an **array** of all of the 
  # different startup domains
  def self.domains
    @@all.map do |find_it|
      find_it.domain
    end.uniq
  end

  # - Should return **all** of the startup instances
  def self.all
    @@all
  end
  
  # - Given a **venture capitalist object**, type of investment (as a string), 
  # and the amount invested (as a float), creates a new funding round 
  # and associates it with that startup and venture capitalist.
  def sign_contract(venture_cap_obj, type, amount)
    FundingRound.new(self, venture_cap_obj, type, amount)
  end

  # HELPER METHOD: This method will collect an array of all of the
  # instances of FundingRound class the company has received.
  def funding_rounds
    FundingRound.all.find_all do |find_it|
      find_it.startup.name == self.name
    end
  end

  # - Returns the total number of funding rounds that the 
  # startup has gotten
  def num_funding_rounds
    funding_rounds.size
  end

  # - Returns a **unique** array of all the 
  # venture capitalists that have invested in this company
  def investors
    funding_rounds.map do |find_it|
      find_it.venture_capitalist 
    end.uniq
  end

  # - Returns a **unique** array of all the venture capitalists that 
  # have invested in this company and are in the Trés Commas club
  def big_investors
    all_investors = []
    investors.find_all do |find_it|
      VentureCapitalist.tres_commas_club.map do |f_commas|
        all_investors << f_commas if f_commas.name == find_it.name
      end
    end
    all_investors
  end

  def biggest_investment
    big_investors
  end

end