class VentureCapitalist
    attr_accessor :name, :total_worth

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
        self.all.find {|venture_cap| venture_cap.total_worth > 1000000000}
    end

    def offer_contract(startup, investment_type, amount)
        FundingRound.new(startup, self, investment_type, amount)
    end

    def funding_rounds
        FundingRound.all.find_all {|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.collect {|funding_round| funding_round.startup}.uniq
    end

    def biggest_investment
       invest_arr = self.funding_rounds.collect {|funding_round| funding_round.investment}
       invest_arr.max
    end

    def invested(domain)
        domains = self.funding_rounds.find_all {|funding_round| funding_round.startup.domain == domain}
        total_invested = 0
        domains.each {|funding_round| total_invested += funding_round.investment}
        total_invested
    end

end



