class VentureCapitalist

    attr_reader :name, :total_worth

    @all = []

    def initialize(name)
        @name = name
        @total_worth = total_worth

        @@all << self 
    end

    def self.all
        @@all 
    end 

    def self.tres_commas_club
        self.all.map do |element|
            element.total_worth >= 1_000_000
        end 
    end 

    def offer_contract(startup, type, investment)
        FoundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FoundingRound.all.select do |name|
            name.venture_capitalist == self 
    end

    def portfolio
        founding_rounds.map do |element|
            name.startup
        end.uniq
    end 

    def biggest_investment
        funding_rounds.map do |element| 
        element.investment.max 
    end 

    def invested(domain)
    total = 0
    funding_rounds.map do |element|
        total += element.domain 
    end 
    total 
end






