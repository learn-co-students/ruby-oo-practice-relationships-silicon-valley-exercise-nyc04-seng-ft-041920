require_relative "../config/environment.rb"

def reload
  load "config/environment.rb"
end

# trello = Startup.new("Trello", "Bowser")
# twitter = Startup.new("Tweet", "Bird")

st1 = Startup.new("Twitter", "Jane", "www.twitter.com")
st2 = Startup.new("Google", "Yoshi", "www.Yoshi.com")
st3 = Startup.new("Trello", "Bowser", "www.Trello.com")

yoshi = VentureCapitalist.new("Yoshi", 2000000000)
bowser = VentureCapitalist.new("Bowser", 1000000000010)
toad = VentureCapitalist.new("Toad", 10000000)
# def sign_contract(vc, inv_type, invested)

st1.sign_contract(yoshi, "initial", -50_000.0)
st1.sign_contract(yoshi, "second", 50_000)
st2.sign_contract(toad, "initial", 50_000)
st3.sign_contract(bowser, "initial", 100_000)
st3.sign_contract(bowser, "sec", 100_000)
st3.sign_contract(toad, "third", 200_000)
st3.sign_contract(yoshi, "yoshi_round", 100_000)

binding.pry

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#leave this here to ensure binding.pry isn't the last line
#
#  through = Founding Round is the joining model, many to many relationship.
#
#
#  starup -< FR >- VentureCapitalist
#  many to many relationship
