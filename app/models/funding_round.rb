class FundingRound

    attr_reader :startup, :vc
    attr_accessor :type, :investment

    @@all =[]

    def initialize(startup, vc, type, investment)
       @startup = startup
       @vc = vc 
       @type = type 
       @investment = investment


       @@all << self 
    end

    def self.all
        @@all 
    end 

end
