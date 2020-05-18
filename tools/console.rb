require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


start_up1 = Startup.new("Memorize", "Alex", "memorize.com")
start_up1.pivot("honey_duck", "Douglas")
start_up2 = Startup.new("Tik-tok", "Zhang Yiming", "tiktok.com")
start_up3 = Startup.new("Twitter", "Jack Dorsey, Noah, Biz, Evan", "twitter.com")
start_up4 = Startup.new("Less Wrong", "Eliezer Yudkowsky", "lessWrong.com")
Startup.all 

ven1 = VentureCapitalist.new("Tingting", 10000000000)
ven2 = VentureCapitalist.new("Sanje", 20000000000)
ven3 = VentureCapitalist.new("Alex Dyck", 20000000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line