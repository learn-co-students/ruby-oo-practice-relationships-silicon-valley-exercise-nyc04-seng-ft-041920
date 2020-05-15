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
        self.all.select do |venture_capitalist|
            venture_capitalist.total_worth > 1000000000
        end
    end

    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount)
    end

    def funding_rounds
        FundingRound.all.select do |f_round|
            f_round.venture_capitalist == self
        end
    end

    def portfolio
       funding_rounds.map do |f_round|
            f_round.startup 
       end.uniq
    end

    def biggest_investment
        largest_investment = funding_rounds[0]
        funding_rounds.each do |f_round|
           if f_round.investment > largest_investment.investment
            largest_investment = f_round
           end
        end
        largest_investment
    end

    def invested(domain)
        funding_rounds.reduce(0) do |sum, f_round|
            if f_round.startup.domain == domain
                sum += f_round.investment
            end
            sum
        end
    end

end