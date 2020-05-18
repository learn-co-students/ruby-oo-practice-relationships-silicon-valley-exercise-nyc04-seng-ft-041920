require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


facebook = Startup.new("Facebook", "Zuck", "social")
medLee = Startup.new("MedLee", "Joe", "health")
apple = Startup.new("Apple", "Steve", "Tech")
uHealth = Startup.new("Nike", "Steve", "health")


vc1 = VentureCapitalist.new("Bashir", 1000000000)
vc2 = VentureCapitalist.new("Joe", 2000000000)

#startup, venture_capitalist, type, investment
fr1 = FundingRound.new(facebook, vc1, "Angel", 500.00)
fr2 = FundingRound.new(apple, vc1, "Angel", 800.00)
fr3 = FundingRound.new(uHealth, vc2, "Angel", 100425000.00)
fr1 = FundingRound.new(facebook, vc2, "Angel", 1000.00)
fr4 = FundingRound.new(medLee, vc2, "Angel", 23452345.00)

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line