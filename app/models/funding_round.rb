class FundingRound

    attr_reader :startup, :venture_capitalist, :type, :investment
    @@all = []
  
    def initialize(startup, venture_capitalist, type, investment)
      @startup = startup
      @venture_capitalist = venture_capitalist
      @type = type
  
      self.investment_check(investment)
      @@all << self
    end
  
    def investment_check(investment_amnt)
      if investment_amnt < 0 || investment_amnt.class != Float
        raise "
        ===============================================================
          Your investment needs to be a decimal number greater than 0.
        =============================================================== "
      else
        @investment = investment_amnt
      end
    end
  
    def self.all
      @@all
    end
  end