require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

instagram = Startup.new("Instagram", "Abc", "social")
zoom = Startup.new("Zoom", "Efg", "tech")
dionlink = Startup.new("Dionlink", "Hig", "tech")

vc_1 = VentureCapitalist.new("Hjin", 1000000000)
vc_2 = VentureCapitalist.new("WHO", 1000)
vc_3 = VentureCapitalist.new("Incognito", 2000000000)

fr1 = FundingRound.new(instagram, vc_1, "Angel", 100.00)

fr2 = FundingRound.new(zoom, vc_1, "Angel", 200)
fr3 = FundingRound.new(zoom, vc_3, "Seed", 300.0)
fr4 = FundingRound.new(zoom, vc_2, "Seed", -300.00)
fr5 = FundingRound.new(dionlink, vc_1, "Seed", 30000.00)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line