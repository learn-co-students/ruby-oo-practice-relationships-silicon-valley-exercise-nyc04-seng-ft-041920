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

    def pivot(name, domain)
        self.name = name
        self.domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find{|startup| startup.founder == founder}
    end

    def self.domains
        self.all.map{|startup| startup.domain}

    end

    def sign_contract(venture_capitalist, type, investment_amount)
        FundingRound.new(self, venture_capitalist, type, investment_amount)
    end

    def funding_rounds
        FundingRound.all.select{|funding_round| funding_round.startup == self}
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.reduce(0){|total, funding_round| total + funding_round.investment_amount}
    end

    def investors
        funding_rounds.map{|funding_round| funding_round.venture_capitalist}.uniq
    end

    def big_investors
        investors.select{|investor| VentureCapitalist.tres_commas_club.include? investor }
    end
end

