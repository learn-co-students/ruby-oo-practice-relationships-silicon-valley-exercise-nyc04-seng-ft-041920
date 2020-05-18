require_relative '../config/environment.rb'
require_all

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Correct
## Startup
facebook = Startup.new("facebook", "Mark Elliot Zuckerberg")
# facebook.pivot("Facebook, Inc.", "Mark Elliot Zuckerberg")
instagram = Startup.new("Instagram", "Kevin Systrom")
# instagram.pivot("Facebook, Inc.", "Mark Elliot Zuckerberg")
neura_link = Startup.new("Neura-Link", "Elon Reeve Musk")
# neura_link.pivot("Tesla, Inc.", "x-ae-a-12")
krusty_krab = Startup.new("Krusty Krab", "Mr.Krabs")
# krusty_krab.pivot("krust", "Pearl")
sabejo = Startup.new("Sabejo", "Jonathan Thomas Dean")
# sabejo.pivot("Sabejo, Inc.", "Myisha Thasin")

## VentureCapitalist
adam_sandler = VentureCapitalist.new("Adam Sandler", 1000000000)
doodle_bob = VentureCapitalist.new("Doodlebob", 5)
mark_zuckerberg = VentureCapitalist.new("Mark Elliot Zuckerberg", 10000000000000)
cohen_brothers = VentureCapitalist.new("Cohens", 10000000000000)
disney = VentureCapitalist.new("Disney", 100000000000000)
apple = VentureCapitalist.new("Apple", 10000000000)
elon_musk = VentureCapitalist.new("Elon Reeve Musk", 1337800851337422713371153)
jonathan_Dean = VentureCapitalist.new("Jonathan Thomas Dean", 0)

## FundingRound
zuck_boi = FundingRound.new(facebook, mark_zuckerberg, "Series A", 801)
cohen_bros = FundingRound.new(facebook,cohen_brothers, "Series A", 27294344)
apple_book = FundingRound.new(facebook, apple, "Series B", 32423444)
doodle_book = FundingRound.new(facebook, doodle_bob, "Series B", 3)
zuck_boi_2 = FundingRound.new(facebook, mark_zuckerberg, "Series B", 10000001)
zuck_boi_3_ElectricBoogaloo = FundingRound.new(facebook, mark_zuckerberg, "Series C", 1000000234231)
zuck_boi_4_TheZuckening = FundingRound.new(facebook, mark_zuckerberg, "Bridge", 1)
the_Musk = FundingRound.new(neura_link, elon_musk, "Series B", 1337801)
krusty_doodle = FundingRound.new(krusty_krab, doodle_bob, "Series A", 1)
krusty_zuck = FundingRound.new(krusty_krab, mark_zuckerberg, "Series B", 100000000)
musk_bob = FundingRound.new(neura_link, doodle_bob, "Series A", 1)
ya_boi = FundingRound.new(sabejo, jonathan_Dean, "Series B", 80000000000000000000001)

# #Incorrect
# ## Startup
# fakebook = Startup.new("facebook", 22)
# fakebook.pivot(222, "Facebook")
# fakestagram = Startup.new(11, "Kevin Systrom")
# fakestagram.pivot("FacebookCoo", 111)

# ## VentureCapitalist
# sadam_andler = VentureCapitalist.new("Adam Sandler".count, "1000000000")
# sponge_bob = VentureCapitalist.new("Spongebob".count, "5")
# zark_muckerberg = VentureCapitalist.new("Mark Zuckerberg".count, "10000000000000")

# ## FundingRound

# round_1 = FundingRound.new("FaceCo", mark_zuckerberg, "Series A".count, "1000")

# Startup.find_by_founder("The Zuckk")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line