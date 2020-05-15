require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
   
apple = Startup.new("apple", "Bashir", "tech")
microsoft = Startup.new("microsoft", "Hannah", "tech")
nike = Startup.new("nike", "Marlon", "fitness")

vc1 = VentureCapitalist.new("Senada", 100000000000000)
vc2 = VentureCapitalist.new("Jack", 2004869)

# startup, venture_capitalist, type, investment)
fr1 = FundingRound.new(apple, vc1, "angel", 10000.0)
fr2 = FundingRound.new(microsoft, vc1, "angel", 23452345.00)
fr3 = FundingRound.new(nike, vc2, "angel", 10000000.0)
fr4 = FundingRound.new(apple, vc2, "angel", 1034540000.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line