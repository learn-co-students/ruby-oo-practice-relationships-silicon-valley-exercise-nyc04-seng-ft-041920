require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# Startups
aviato = Startup.new("Aviato", "Social Media Aggregation", "Ehrlich Bachman")
pied_piper = Startup.new("Pied Piper", "Data Compression", "Richard Hendricks")
smokation = Startup.new("Smokation", "Smoking Locations", "Jian Yang")
seefood = Startup.new("SeeFood", "Shazam for Food", "Jian Yang")

# Venture Capitalist
raviga = VentureCapitalist.new("Raviga", 50000000)
coleman_blair = VentureCapitalist.new("Coleman Blair", 25000000)
hanneman = VentureCapitalist.new("Hanneman Outdoor Media", 2000000000)

# Funding Rounds
hairy_question_mark = FundingRound.new(pied_piper, raviga, "Angel", 5000000)
special_occasion = FundingRound.new(smokation, raviga, "Angel", 100000)


# instance methods
aviato.name
aviato.founder
aviato.domain

seefood.pivot("Not Hotdog", "Shazam, but for Hot Dogs")
seefood.name
seefood.domain

raviga.name
hanneman.total_worth

hairy_question_mark.startup
hairy_question_mark.venture_capitalist
hairy_question_mark.type
hairy_question_mark.investment

# class methods
Startup.all
Startup.find_by_founder("Jian Yang")
Startup.domains

VentureCapitalist.all
VentureCapitalist.tres_commas_club

FundingRound.all

aviato.sign_contract(raviga, "angel", 25000)
hanneman.offer_contract(pied_piper, "Pre-Seed", 50000)

pied_piper.num_founding_rounds
pied_piper.investors
pied_piper.big_investors

hanneman.funding_rounds

raviga.portfolio

raviga.biggest_investment

pied_piper.total_funds

raviga.invested("Smoking Locations")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
