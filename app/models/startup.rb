require 'pry'

class Startup

    @@all = [] #glbal var. 

    attr_accessor :name, :domain  #attr accessor macro(setter method + getter method)
    attr_reader :founder

    def initialize(name, founder, domain) 
        @name = name #instance var
        @founder = founder
        @domain = domain
    
        @@all << self # add all the instances in the global var
    end

    def pivot(new_domain, new_name) #need to create a new calling instance var and method invoked in the console. 
        @domain = new_domain
        @name = new_name
    end

    def self.all  #class var. #command `Start.all` #in this case, self == Startup
        @@all
    end

    def self.find_by_founder(founder_name)  #command should be `Startup.find_by_founder("Alex")`
        self.all.find do |each_start_up|
            founder_name == each_start_up.founder       
        end
    end

    def self.domains
        domain_arr = []
        self.all.map do |each_startup_obj|
         each_startup_obj.domain            
        end
    end


    
end
