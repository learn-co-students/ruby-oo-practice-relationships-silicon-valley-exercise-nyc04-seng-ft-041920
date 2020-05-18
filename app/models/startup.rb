class Startup

    attr_reader  :name, :founder, :domain
    @@all = []

    def initialize(name, founder)
        @name = ask_string(name)
        @founder = founder
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain.to_s
        @name = ask_string(name)
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.find{|startup| startup.founder == ask_string(founder_name)}
    end

    def self.domains
        self.all.map(&:domain).uniq 
    end

    def sign_contract(venture_capitalist, investment_type, investment_amount)
        FundingRound.new(self, venture_capitalist,  ask_type(investment_type), ask_float(investment_amount))
    end

    def num_funding_rounds
        FundingRound.all.select{|funding|
            funding.startup == self
        }
    end

    def total_funds
        num_funding_rounds.map(&:investment).compact.reduce(:+)
    end

    def investors
        num_funding_rounds.map{|funding|
            funding.venture_capitalist
        }
    end

    def big_investors
        num_funding_rounds.map {|funding|
            if VentureCapitalist.tres_commas_club.include?(funding.venture_capitalist)
                funding.venture_capitalist 
            end
        }.compact
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
