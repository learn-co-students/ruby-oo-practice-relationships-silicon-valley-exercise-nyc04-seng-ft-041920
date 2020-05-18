require 'pry'

class Startup

    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

def initialize(name, founder, domain)
    @name = name 
    @founder = founder 
    @domain = domain 

    @@all << self 
end

def pivot(new_name, new_domain)
    @name = new_name
    @domain = new_domain
end 

def self.all
    @@all 
end 

def self.find_by_founder(name)
   self.all.find do |element|
        element.name == name 
    end 
end 

def self.domains
    self.all.map do |element|
    element.domain
    end.uniq 
end 

def sign_contract(vc, type, invested)
    FoundingRound.new(self, vc, type, invested)
end 

def num_funding_rounds
    FoundingRound.all.select do |num|
        num.startup == self 
    end 
end 

def total_funds
    total = 0
    num_funding_rounds.map do |element|
        total += element.investment 
    end 
    total
end 

def investors
    num_funding_rounds.map do |name|
        name.venture_capitalist
    end.uniq
end 

def big_investors
    investors.select do |name|
        name.total_worth > 1_000_000
    end.uniq 
end 

end






