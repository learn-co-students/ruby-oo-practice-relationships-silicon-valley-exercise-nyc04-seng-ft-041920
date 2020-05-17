require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# ************************************
#       INSTANCES OF Startup Class
# ************************************
# (name, founder, domain)
apple = Startup.new("APPLE", "STEVE", "TECH")
microsoft = Startup.new("MICROSOFT", "BILL", "TECH")
amazon = Startup.new("AMAZON", "JEFF", "E-COMMERCE")
uber = Startup.new("UBER", "DARA", "TRANSPORTATION")

# ************************************
# INSTANCES OF VentureCapitalist Class
# ************************************
# (name, total_worth)

# MILLIONAIR
marcio = VentureCapitalist.new("MARCIO", 10200100)
# MILLIONAIR
isabel = VentureCapitalist.new("ISABEL", 50500400)
# BILLIONAIR
marcelo = VentureCapitalist.new("MARCELO", 3400300200)
# BILLIONAIR
marlon = VentureCapitalist.new("MARLON", 2600500400)
# BILLIONAIR
rod = VentureCapitalist.new("ROD", 1900800700)

# ************************************
#   INSTANCES OF FundingRound Class
# ************************************
# (startup, venture_capitalist, type, investment=0.0)
# Angel, Pre-Seed, Seed
# MARLON
round_1 = FundingRound.new(apple, marlon, "PRE-SEED", 4300200.0)
# MARCELO
round_4 = FundingRound.new(uber, marlon, "SEED", 1200300.0)
# ISABEL
round_5 = FundingRound.new(microsoft, isabel, "ANGEL", 10900800.0)
round_6 = FundingRound.new(apple, isabel, "ANGEL", 2700600) # WILL NOT WORK

# MARCIO
# round_9 = FundingRound.new(apple, marcio, "ANGEL", -9000000.0) # WILL NOT WORK


puts "************************************"
puts "      TESTING STARTUP CLASS"
puts "************************************"
#p apple.name
#p apple.founder
#p apple.domain
puts ""
puts "            Startup.all"
puts "------------------------------------"
p Startup.all
puts ""
puts "==================================="
puts "      Startup.find_by_founder"
puts "------------------------------------"
p Startup.find_by_founder("STEVE")
puts ""
puts "==================================="
puts "      Startup.domains"
puts "------------------------------------"
p Startup.domains
puts ""
puts "==================================="
puts ""
puts "************************************"
puts "  TESTING VENTURECAPITALIST CLASS"
puts "************************************"
# p marlon.name
# p marlon.total_worth
# p rod.name
# p rod.total_worth
puts ""
puts "      VentureCapitalist.all"
puts "------------------------------------"
p VentureCapitalist.all
puts ""
puts "==================================="
puts " VentureCapitalist.tres_commas_club"
puts "------------------------------------"
p VentureCapitalist.tres_commas_club
puts ""
puts "************************************"
puts "   TESTING FUNDINGROUND CLASS"
puts "************************************"
# (startup, venture_capitalist, type, investment=0.0)
#
# round_1 = FundingRound.new(apple, marlon, "PRE-SEED", 4300200.0)
#
# p round_1.startup
# p round_1.venture_capitalist
# p round_1.type
# p round_1.investment

# round_1.startup=microsoft
# round_1.venture_capitalist=marcelo
# round_1.type="--angel--"
# p round_1.type
# round_1.investment=1000000.0
puts ""
puts "      FundingRound.all"
puts "------------------------------------"
# pp FundingRound.all
puts ""
puts "****************************************"
puts "****************************************"
puts "   ASSOCIATINS AND AGGREGATE METHODS"
puts "            STARTUP CLASS"
puts "****************************************"
puts "****************************************"
puts ""
puts "      Startup.sing_contract"
puts "------------------------------------"
# uber.sign_contract(marcio, "SEED", 100200.0)
uber.sign_contract(marlon, "SEED", 100200.0)
puts ""
uber.sign_contract(marcelo, "ANGEL", 1200300.0)
puts ""
puts "==================================="
puts "    Startup.num_funding_rounds"
puts "------------------------------------"
uber.num_funding_rounds
puts ""
puts "==================================="
puts "    Startup.investors"
puts "------------------------------------"
uber.investors
puts ""
puts "==================================="
puts "    Startup.big_investors"
puts "------------------------------------"
p uber.big_investors
puts ""
puts "****************************************"
puts "****************************************"
puts "   ASSOCIATINS AND AGGREGATE METHODS"
puts "        VENTURECAPITALIST CLASS"
puts "****************************************"
puts "****************************************"
puts ""
puts "  VentureCapitalist.offer_contract"
puts "------------------------------------"
# (startup, type, amount)
p marcio.offer_contract(amazon, "PRE-SEED", 1500400.0)
puts ""
p marlon.offer_contract(amazon, "SEED",  1200300.0)
puts ""
p marcelo.offer_contract(apple, "ANGEL", 1500400300.0)
puts ""
p marcio.offer_contract(apple, "SEED", 2500400.0)
puts ""
p marcio.offer_contract(microsoft, "ANGEL", 100000.0)
puts ""
puts "==================================="
puts "  VentureCapitalist.funding_rounds"
puts "------------------------------------"
marcio.funding_rounds
puts ""
puts "==================================="
puts "  VentureCapitalist.portfolio"
puts "------------------------------------"
pp marcio.portfolio
puts ""
puts "==================================="
puts "VentureCapitalist.biggest_investment"
puts "------------------------------------"
p marcio.biggest_investment
puts ""
puts "==================================="
puts "VentureCapitalist.invested"
puts "------------------------------------"
p marcio.invested("TECH")

0 #leave this here to ensure binding.pry isn't the last line
# binding.pry