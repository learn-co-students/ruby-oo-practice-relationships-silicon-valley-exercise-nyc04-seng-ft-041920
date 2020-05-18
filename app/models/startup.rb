class Startup
   attr_reader :name, :founder, :domain
   attr_accessor 

   @@all = []
  
   def initialize(name, founder, domain)
    @name = name
    @domain = domain
    @founder = founder
    @@all << self
    
   end

   def pivot(domain, name)
       @domain = domain
       @name = name
       
       end

   def self.all
    @@all
   end

   def self.find_by_founder(name)
      self.all.find do |startup|
      startup.founder == name
      end
  end

  def self.domains
    self.all.collect {|startup| startup.domain}.uniq
    
  end   

  def sign_contract(vc, type, amount)
    FundingRound.new(self, vc, type, amount)
  end

  def num_funding_rounds
    FundingRound.all.select {|round| round.startup == self}.length
  end

  def total_funds
   a = FundingRound.all.select {|round| round.startup == self}
   a.map {|round| round.investment}.sum
  end

  def investors
   a = FundingRound.all.select {|round| round.startup == self}
   a.map {|round| round.venture_capitalist}.uniq
  end

  def big_investors
    self.investors.select {|vc| vc.total_worth > 1_000_000_000}
  end









end
