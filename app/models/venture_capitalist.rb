class VentureCapitalist
    @@all = []
    attr_reader :name, :total_worth

    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def self.tres_commas_club 
        self.all.select{|v_capitalist| v_capitalist.total_worth > 1000000000}
    end 

    def offer_contract(startup, type, amount)
        FundingRound.new(startulp, self, type, investment)
    end 

    def funding_rounds 
        FundingRound.all.select{|f_round| f_round.venture_capitalist == self}
    end 

    def portfolio 
        funding_rounds.map{|f_round| f_round.startup}.uniq 
    end 

    def biggest_investment 
        funding_rounds.max{|a,b|  a.investment <=> b.investment}
    end 

    def invested(domain)
        funding_rounds.reduce(0){|sum, f_round| 
            if f_round.startup.domain == domain 
                sum += f_round.investment
            end 
            sum 
        }
    end 
end
