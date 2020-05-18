# Object Relations Code Challenge

Welcome to Silicon Valley! For this assignment, our domain is the startup world! We have three models - `Startup`, `VentureCapitalist`, and `FundingRound`. A `Startup` has many `VentureCapitalist`s through `FundingRound`s.

If you are not sketching out your domain, and thinking about single source of truth,
you are doing it wrong :(

## Topics

- Classes vs Instances
- Variable Scope ( Class, Instance, Local )
- Object Relationships
- Arrays and Array Methods
- Class Methods

## Notes

Your goal is to build out all of the methods listed in the deliverables. Do your best to follow Ruby best practices. For example, use higher-level array methods such as `map`, `select`, and `find` when appropriate in place of `each`

We've provided you with a console that you can use to test your code. To enter a console session, run `ruby tools/console.rb` from the command line. You'll be able to test out the methods that you write here. Take a look at that file to see how you can pre-define variables and create object instances, rather than manually doing it in every single console session.

**Remember!** This is a code challenge without tests. You cannot run `rspec` you cannot run `learn`. You'll need to create your own sample instances for testing purposes. Make sure your associations and methods work in the console before submitting.

## Deliverables

### Basic Class Methods and Properties

#### Build the following methods on the `Startup` class

- [x] `Startup#name`
  - returns a **string** that is the startup's name
```ruby
aviato.name
=> => "Aviato"
```
---
- [x] `Startup#founder`
  - returns a **string** that is the founder's name
  - Once a startup is created, the founder cannot be changed.
```ruby
aviato.founder
=> "Ehrlich Bachman"
```
---
- [x] `Startup#domain`
  - returns a **string** that is the startup's domain
```ruby
aviato.domain
=> "Social Media Aggregation"
```
- [x] `Startup#pivot`
  - given a string of a **domain** and a string of a **name**, change the domain
    and name of the startup. This is the only public method through which the
    domain should be changed.
```ruby
seefood.pivot("Not Hotdog", "Shazam, but for Hot Dogs")
seefood.name
"Not Hotdog"
seefood.domain
"Shazam, but for Hot Dogs"
```
---
- [x] `Startup.all`
  - should return **all** of the startup instances
```ruby
Startup.all
# while there is only one startup, this is what returns.
# revisit to add more
=> [#<Startup:0x000055ea55762a88 @name="Aviato", @domain="Social Media Aggregation", @founder="Ehrlich Bachman">]
```
---
- [x] `Startup.find_by_founder`
  - given a string of a **founder's name**, returns the **first startup** whose founder's name matches
```ruby
Startup.find_by_founder("Jian Yang")
=> #<Startup:0x000055a5d00f4df0 @name="Smokation", @domain="Smoking Locations", @founder="Jian Yang">
```
---
- [x] `Startup.domains`
  - should return an **array** of all of the different startup domains
```ruby
Startup.domains
=> ["Social Media Aggregation", "Data Compression", "Smoking Locations", "Shazam, but for Hot Dogs"]
```
---

#### Build out the following methods on the `VentureCapitalist` class

- [x] `VentureCapitalist#name`
  - returns a **string** that is the venture capitalist's name
```ruby
raviga.name
=> "Raviga"
```
- [x] `VentureCapitalist#total_worth`
  - returns a **number** that is the total worth of this investor (e.g., think of it as how much money they have)
```ruby
hanneman.total_worth
=> 2000000000
```
- [x] `VentureCapitalist.all`
  - returns an array of all venture capitalists
```ruby
VentureCapitalist.all
=> [#<VentureCapitalist:0x000055f01bf92bb0 @name="Raviga", @total_worth=50000000>, #<VentureCapitalist:0x000055f01bf92b60 @name="Coleman Blair", @total_worth=25000000>, #<VentureCapitalist:0x000055f01bf92b10 @name="Hanneman Outdoor Media", @total_worth=2000000000>]
```
- [x] `VentureCapitalist.tres_commas_club`
  - returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)
```ruby
VentureCapitalist.tres_commas_club
# would be an array of more people but currently everyone is poor, market bad, ehrlich liar
=> [#<VentureCapitalist:0x000055dfd920e608 @name="Hanneman Outdoor Media", @total_worth=2000000000>]
```

---

#### Build out the following methods on the `FundingRound` class

- [x] `FundingRound#startup`
  - returns the startup object for that given funding round
  - Once a funding round is created, I should not be able to change the startup
```ruby
hairy_question_mark.startup
=> #<Startup:0x000056398a3261c0 @name="Pied Piper", @domain="Data Compression", @founder="Richard Hendricks">
```
---
- [x] `FundingRound#venture_capitalist`
  - returns the venture capitalist object for that given funding round
  - Once a funding round is created, I should not be able to change the venture capitalist
```ruby
hairy_question_mark.venture_capitalist
=> #<VentureCapitalist:0x000056045d5d5bd0 @name="Raviga", @total_worth=50000000>
```
---
- [x] `FundingRound#type`
  - returns a **string** that is the type of funding round
  - Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
```ruby
hairy_question_mark.type
=> "Angel"
```
- [x] `FundingRound#investment`
  - returns a **number** that is the amount invested during this funding round
  - This should be a float that is not a negative number.
```ruby
hairy_question_mark.investment
=> 5000000.0
```
- [x] `FundingRound.all`
  - returns all of the funding rounds
```ruby
FundingRound.all
=> [#<FundingRound:0x00005558047814a8 @startup=#<Startup:0x0000555804781728 @name="Pied Piper", @domain="Data Compression", @founder="Richard Hendricks">, @venture_capitalist=#<VentureCapitalist:0x0000555804781598 @name="Raviga", @total_worth=50000000>, @type="Angel", @investment=5000000.0>, #<FundingRound:0x0000555804781458 @startup=#<Startup:0x0000555804781688 @name="Smokation", @domain="Smoking Locations", @founder="Jian Yang">, @venture_capitalist=#<VentureCapitalist:0x0000555804781598 @name="Raviga", @total_worth=50000000>, @type="Angel", @investment=100000.0>]
```

---

### Associations and Aggregate Methods

#### Startup

- [x] `Startup#sign_contract`
  - given a **venture capitalist object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
```ruby
aviato.sign_contract(raviga, "angel", 25000)
=> #<FundingRound:0x000055afe05d55a8 @startup=#<Startup:0x000055afe05d5a58 @name="Aviato", @domain="Social Media Aggregation", @founder="Ehrlich Bachman">, @venture_capitalist=#<VentureCapitalist:0x000055afe05d5828 @name="Raviga", @total_worth=50000000>, @type="angel", @investment=25000.0>
```
- [x] `Startup#num_funding_rounds`
  - Returns the total number of funding rounds that the startup has gotten
  ```ruby
  pied_piper.num_founding_rounds
  => 2
  ```
- [x] `Startup#total_funds`
  - Returns the total sum of investments that the startup has gotten
```ruby
pied_piper.total_funds
=> 5050000.0
```
- [x] `Startup#investors`
  - Returns a **unique** array of all the venture capitalists that have invested in this company
```ruby
pied_piper.investors
=> ["Raviga", "Hanneman Outdoor Media"]
```
- [x] `Startup#big_investors`
  - Returns a **unique** array of all the venture capitalists that have invested in this company and are in the Trés Commas club
```ruby
pied_piper.big_investors
=> ["Hanneman Outdoor Media"]
```

#### VentureCapitalist

- [x] `VentureCapitalist#offer_contract`
  - given a **startup object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
```ruby
hanneman.offer_contract(pied_piper, "Pre-Seed", 50000)
=> #<FundingRound:0x00005615b27655e8 @startup=#<Startup:0x00005615b2765a48 @name="Pied Piper", @domain="Data Compression", @founder="Richard Hendricks">, @venture_capitalist=#<VentureCapitalist:0x00005615b2765818 @name="Hanneman Outdoor Media", @total_worth=2000000000>, @type="Pre-Seed", @investment=50000.0>
# and then he blew a good chunk of that on swag
```
- [x] `VentureCapitalist#funding_rounds`
  - returns an array of all funding rounds for that venture capitalist
```ruby
hanneman.funding_rounds
=> 1
```
- [x] `VentureCapitalist#portfolio`
  - Returns a **unique** list of all startups this venture capitalist has funded
```ruby
raviga.portfolio
=> ["Pied Piper", "Smokation", "Aviato"]
```
- [x] `VentureCapitalist#biggest_investment`
  - returns the largest funding round given by this venture capitalist
```ruby
raviga.biggest_investment
=> 5000000.0
```
- [x] `VentureCapitalist#invested`
  - given a **domain string**, returns the total amount invested in that domain
```ruby
raviga.invested("Smoking Locations")
=> 100000.0
```

---
