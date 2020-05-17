require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# OUR STARTUPS!!!!!!!!!!!!!!!!!
start_up1 = Startup.new("Pied Piper", "Richard Hendricks", "new internet")
start_up2 = Startup.new("Apple", "Steve Jobs", "Electronics")
start_up3 = Startup.new("Facebook", "Mark Zuck", "Social Media")
start_up4 = Startup.new("Amazon", "Jeff Bezos", "e-commerce")

# OUR VC'S!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
vc1 = VentureCapitalist.new("Accel", 100000)
vc2 = VentureCapitalist.new("Benchmark", 200000)
vc3 = VentureCapitalist.new("Russ Hanneman", 1000000000)
vc4 = VentureCapitalist.new("Gavin Belson", 1000000000)

# EXAMPLES OF FUNDING ROUNDS!!!!!!!!!!!!!!!!!!
fr1 = FundingRound.new(start_up1, vc3, "Series A", 10000.00)
fr2 = FundingRound.new(start_up4, vc4, "Series B", 20000.00)
fr3 = FundingRound.new(start_up1, vc3, "Series B", 50000.00)

# EXAMPLES OF STARTUPS SIGNING CONTRACT!!!!!!!!
start_up1.sign_contract(vc4, "Angel", 200000.00)
start_up1.sign_contract(vc1, "series a", 20000.00)

# EXAMPLE OF A VC OFFERING A CONTRACT!!!!!!!!!!!!!!!!!!!!!!!
vc3.offer_contract(start_up3, "Series B", 300000.50)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line

