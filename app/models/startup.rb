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
        self.all.find {|startup| startup.founder == name}
    end

    def self.domains
        self.all.collect {|startup| startup.domain}.uniq
    end  

    def sign_contract(vc, type, amount)
        FundingRound.new(self, vc, type, amount.to_f)
    end

    def get_funding_rounds
        FundingRound.all.select {|round| round.startup == self}
    end

    def num_funding_rounds
        self.get_funding_rounds.count
    end

    def total_funds
        self.get_funding_rounds.reduce(0) {|total, round| total + round.investment}
    end

    def investors
        self.get_funding_rounds.collect {|fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select {|vc| vc.total_worth > 1_000_000_000}.uniq
    end
end