class VentureCapitalist

    attr_reader :name, :total_worth
     
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth.to_f
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select{|vc| vc.total_worth > 1000000000}
    end


    def offer_contract(startup, type_of_investment, investment)
        FundingRound.new(startup, self, type_of_investment, investment.to_f)
    end

    # All the funding round this VC made
    def funding_rounds
        FundingRound.all.select{|fr| fr.venture_capitalist == self}
    end

    #Returns a unique list of all startups this venture capitalist has funded
    def portfolio
        funding_rounds.map{|fr| fr.startup}.uniq
        #binding.pry
    end

    def biggest_investment
        funding_rounds.max{|a,b|  a.investment <=> b.investment}
    end

    #given a domain string, returns the total amount invested in that domain
    def invested(domain)
        #binding.pry
        funding_rounds.select{|fr| fr.startup.domain == domain}.map{|fr| fr.investment}.sum
    end
end
