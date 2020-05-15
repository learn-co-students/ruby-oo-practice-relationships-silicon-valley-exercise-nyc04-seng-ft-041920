class Startup
    
    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(name)
        self.all.find do |startup|
            startup.founder == name
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(v_capitalist, type, amount)
        FundingRound.new(self, v_capitalist, type, amount)
    end 

    def funding_rounds 
        FundingRound.all.select{|funding_round| funding_round.startup == self}
    end 

    def num_funding_rounds
        self.funding_rounds.count 
    end 

    def total_funds 
        self.funding_rounds.reduce(0) do |sum, funding_round|
            sum += funding_round.investment 
        end 
    end

    def investors
        funding_rounds.map do |f_round|
            f_round.venture_capitalist 
        end.uniq 
    end 

    def big_investors
        investors = []
        self.funding_rounds.each do |f_round|
            if VentureCapitalist.tres_commas_club.include?(f_round.venture_capitalist)
                 investors << f_round.venture_capitalist
            end
        end
        investors.uniq
    end 

end 