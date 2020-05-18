class VentureCapitalist
    
    attr_reader :name, :total_worth
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
        self.all.find_all{|venture_capitalist| venture_capitalist.total_worth >= 1000000000}
    end

    def offer_contract(startup, type, investment_amount)
        FundingRound.new(startup, self, type, investment_amount)
    end

    def funding_rounds
        FundingRound.all.select{|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map{|funding_round| funding_round.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by{|funding_round| funding_round.investment_amount}
    end

    def invested(domain_str)
        domain = funding_rounds.select {|funding_round| funding_round.startup.domain == domain_str }
        domain.sum {|funding_round| funding_round.investment_amount}
    end

end
