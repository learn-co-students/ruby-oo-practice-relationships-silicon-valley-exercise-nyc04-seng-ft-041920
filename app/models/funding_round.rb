class FundingRound
    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        if investment > 0
            @investment = investment.to_f
        else
            @investment = 0
        end
        @@all << self
    end

    def investment=(amount)
        if amount > 0
            @investment = amount.to_f
        end
    end

    def self.all 
        @@all
    end


end
