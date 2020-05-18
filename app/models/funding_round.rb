class FundingRound

    @@all = []

    attr_reader :startup, :venture_capitalist, :type, :investment

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup 
        @venture_capitalist = venture_capitalist
        @type = type 
        amount_check(investment)
        @@all << self 
    end 


    def amount_check(amount)
        if amount <= 0 || amount.class != Float
            raise "Invalid Amount entered.  Must be a Float greater than zero"
        end 
        @investment = amount 
    end 

    def self.all 
        @@all 
    end 


end
