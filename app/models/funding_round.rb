class FundingRound
    attr_reader :startup, :venture_capitalist, :type 
    attr_accessor :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @investment = ask_float(investment)
        @type = ask_type(type)
        @@all << self
    end

    def investment
        @@all.map{|funding|
            funding.investment if funding.type == self.type
        }.compact.reduce(:+)
    end

    def self.all
        @@all
    end

    private
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
        while number =~ /^[a-zA-Z\-\s]+$/ || number < 0.000
            puts "Please put an amount of money. ex: #{rand(1..999)},#{rand(100..999)},#{rand(100.0..999.0).round(2)}"
            number = gets.chomp
        end

        cents_correction = ('%.2f' % number).to_f
        cents_correction
    end


end
