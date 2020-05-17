require_relative "venture_capitalist.rb"
require_relative "funding_round.rb"

class Startup
    attr_reader :founder 
    attr_accessor :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot(new_domain, new_name)
        @domain = new_domain 
        @name = new_name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        self.all.collect {|startup| startup.domain}.uniq
    end

    def sign_contract(venture_cap, type_string, amount_f)
        FundingRound.new(self, venture_cap, type_string, amount_f)
    end

    #created this method to keep the ones that follow dry(er)
    def funding_rounds
        arr = FundingRound.all.find_all{|fund_round| fund_round.startup == self}
    end

    def num_funding_rounds
        # arr = FundingRound.all.find_all{|fund_round| fund_round.startup == self}
        # arr.count
        # arr
        self.funding_rounds.count
    end

    #think about refactoring this
    def total_funds
        sum = 0
        FundingRound.all.each do |fund_round|
            if fund_round.startup == self 
                sum += fund_round.investment
            end
        end
        return sum
    end

    def investors
        self.funding_rounds.collect {|fund_round| fund_round.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.find_all {|investor| investor.total_worth > 1000000000}
    end

end

# Startups
uber = Startup.new("Uber", "Garrett Camp", "Uber.com")
microsoft = Startup.new("Microsoft", "Bill Gates", "Microsoft.com")

#Venture Capitalists
mariah = VentureCapitalist.new("Mariah Carey", 2000000000)
jlo = VentureCapitalist.new("Jennifer Lopez", 99)

# pp VentureCapitalist.tres_commas_club
# pp VentureCapitalist.all

# # pp Startup.find_by_founder("Bill Gates")

# # pp Startup.domains

f1 = FundingRound.new(uber, mariah, "C", 300)
f2 = FundingRound.new(uber, jlo, "B", 200)

f3 = FundingRound.new(microsoft, jlo, "C", 400)
f4 = FundingRound.new(microsoft, jlo, "B", 500)

pp jlo.invested("Uber.com")

# pp f1.type