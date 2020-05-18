class VentureCapitalist
    
    attr_reader :name, :total_worth #instance var

    @@all = [] #class var

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
    
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club  #how to call this method: 1.need binding.pry in the method. 2. create instances in console. 3. `ruby console.rb` 4. `VentureCapitalist.tres_commas_club`
        self.all.select do |each_capitalist|
            each_capitalist.total_worth > 1000000000
        end
    
        
    end


end