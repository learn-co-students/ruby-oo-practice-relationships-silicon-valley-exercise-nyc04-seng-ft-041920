require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new("youtube", "elisheva", "youtube.com")
s2 = Startup.new("crocs", "jim smith", "crocs.com")
s3 = Startup.new("gummy straws", "jane elizabeth", "gummystrawscom")

v1 = VentureCapitalist.new("Jeff Bezos", 325000000000)
v2 = VentureCapitalist.new("Bill Gates", 35000000000)
v3 = VentureCapitalist.new("John doe", 990000)

f1 = FundingRound.new(s1, v3, "pre-seed", 6000)
f1 = FundingRound.new(s1, v3, "seed", 11000)
f2 = FundingRound.new(s2, v1, "seed", 999666)
f3 = FundingRound.new(s3, v1, "series b", 1234567)
f4 = FundingRound.new(s1, v2, "seed", 9999)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line