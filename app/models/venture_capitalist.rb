class VentureCapitalist
    
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = ask_string(name)
        @total_worth = ask_float(total_worth)
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |investor|
            investor.total_worth > 1000000000
        end
    end

    def offer_contract(startup, investment_type, investment)
        FundingRounds.new(startup, self, ask_type(investment_type), ask_float(investment))
    end

    def funding_rounds
        FundingRound.all.select do |funding|
            funding.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.map(&:startup)
    end

    def biggest_investment
        x = funding_rounds.map(&:investment).sort
        x[x.length-1]
    end

    def invested(domain)
         funding_rounds.map{|funding|
            funding.investment if funding.startup.domain == domain
        }.compact.reduce(:+)
    end

    private

    def ask_string(name)
        while name !~ /^[a-zA-Z\-\s]+$/
            puts "Please put a Word, Dashes(-) and Underscores accepted."
            name = gets.chomp
        end
        name
    end

    def ask_type(type_name)
        rounds = ["Pre-Seed", "Seed", "Angel", "Series A", "Series B", "Series C", "Bridge" ]

        while !rounds.include?(type_name)
            puts "Please put a correct type."
            rounds.each do |type|
                puts type
            end
            type_name = gets.chomp
        end
        type_name
    end

    def ask_float(number)
        while number =~ /^[a-zA-Z\-\s]+$/ 
            puts "Please put an amount of money. ex: #{rand(1..999)},#{rand(100..999)},#{rand(100.0..999.0).round(2)}"
            number = gets.chomp
        end

        cents_correction = ('%.2f' % number).to_f
        cents_correction
    end


end
