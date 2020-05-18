Run this when we need to check something:

```zsh
 ruby tools/console.rb
```

----

**Don't use each for enumeration :: use `map`, `select`, and `find` when appropriate in place of `each`**

1. `FundingRound#startup`
  - returns the startup object for that given funding round
  - Once a funding round is created, I should not be able to change the startup

```ruby

    def startup
        @startup
    end

    attr_reader :startup

```

2. `FundingRound#venture_capitalist`
  - returns the venture capitalist object for that given funding round
  - Once a funding round is created, I should not be able to change the venture capitalist
 
```ruby

    def venture_capitalist
        @venture_capitalist
    end

    attr_reader :venture_capitalist

```

3. `FundingRound#type`
  - returns a **string** that is the type of funding round
  - Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.

```ruby

    def type
        @type
    end

    attr_reader :type

```

4. `FundingRound#investment`
  - returns a **number** that is the amount invested during this funding round
  - This should be a float that is not a negative number.

```ruby

    def investment
        @investment
    end

    attr_reader :investment

```

5. `FundingRound.all`
  - returns all of the funding rounds

```ruby
    ...
    @@all = []                  # Initializes an empty Array

    def initialize ...
        ...
        @@all << self           # Shovels the entire current <Class> into the <Array>
        @@all
    end

    ...

    def self.all
        @@all                   #returns the entirety of <Array> @@all
    end

```

## All of The above code can be written more formally like so:
### storing the variables in accessor because we aren't required to restrict permissions.

```ruby

    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment
 
    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @investment = investment
        @type = type
        @@all << self
    end

    def self.all
        @@all
    end

```

### What my Final Code looks like:
<Details>
<summary> Final Code</summary>

```ruby

    attr_reader :startup, :venture_capitalist 
    attr_accessor :type, :investment
    # @@rounds = ["Pre-Seed", "Seed", "Angel", "Series A", "Series B", "Series C", "Bridge" ]
    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @investment = investment
        @type = type
        @@all << self
    end

    def self.all
        @@all
    end

```

</Details>
