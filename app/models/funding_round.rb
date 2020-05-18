class FundingRound
    
    attr_accessor :startup, :venture_capitalist
    attr_reader :type, :investment

    #type : Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc

    @@all = []

    def self.all
        @@all
    end

    def initialize(startup, venture_capitalist, type, investment)

        if investment <= 0
            puts "It is impossible to invest $#{investment}. Please enter more then $0" 
        else
            @startup = startup
            @venture_capitalist = venture_capitalist
            @type = type
            investment.to_f
            @investment = investment

            @@all << self
        end
        
    end


    #returns a number that is the amount invested during this funding round
    #This should be a float that is not a negative number.
    # def amount_check(investment)
        #raise
    # end


    
end
