class Startup
    #attr_accessor 
    attr_reader :founder, :domain, :name

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @domain = domain
        @name = name 
    end

    def self.find_by_founder(name)
        self.all.find do |startup|
            startup.founder == name
        end
    end

    def self.domains
        domain = self.all.collect do |startup|
                    startup.domain
                end

        domain.uniq
    end

    # given a venture capitalist object, type of investment (as a string), 
    # and the amount invested (as a float), creates a new funding round 
    # and associates it with that startup and venture capitalist.
    def sign_contract(vc, type_of_investment, investment)
        FundingRound.new(self, vc, type_of_investment, investment.to_f)
    end

    ##modulized repeating code
    #returns Array of all the funding rounds associated with called startup
    def funding_rounds
        FundingRound.all.select{|fr| fr.startup == self}
    end
    
    # Returns the total number of funding rounds that the startup has gotten
    def num_funding_rounds
        funding_rounds.size
    end

    # Returns the total number of funding rounds that the startup has gotten
    def total_funds
        #binding.pry
        funding_rounds.map{|fr| fr.investment}.sum
    end

    #Returns a unique array of all the venture capitalists that have invested in this company
    def investors
        funding_rounds.map{|fr| fr.venture_capitalist}.uniq
    end

    #Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
    def big_investors
        investors.select{|vc| vc.total_worth > 1000000000 }
    end


end


    

    
