class Startup

    @@all = []

    attr_reader :name, :founder, :domain 

    def initialize(name, founder, domain)
        @name = name 
        @founder = founder 
        @domain = domain 
        save 
    end 

    def save 
        @@all << self 
    end 

    def pivot(domain, name)
        @domain = domain 
        @name = name 
    end 

    def self.all 
        @@all 
    end 

    def self.find_by_founder(founder_name)
        self.all.select{|company| company.founder == founder_name}
    end 

    def self.domains 
        self.all.map{|company| company.domain}.uniq 
    end 
    
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    #returns all funding rounds associated with this startup
    def funding_rounds 
        FundingRound.all.select{|f_round| f_round.startup == self}
    end 

    def num_funding_rounds
        funding_rounds.count 
    end 

    def total_funds 
        funding_rounds.reduce(0){|sum, f_round| sum += f_round.investment}
    end 

    def investors 
        funding_rounds.map{|f_round| f_round.venture_capitalist}.uniq 
    end 

    #refactored 
    def big_investors 
        funding_rounds.map{ |f_round| 
        
            if f_round.venture_capitalist.total_worth > 1000000000
                f_round.venture_capitalist
            end 
        }.compact 
    end 


end
