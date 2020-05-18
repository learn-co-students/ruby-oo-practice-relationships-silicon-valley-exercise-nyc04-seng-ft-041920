Run this when we need to check something:

```zsh
 ruby tools/console.rb
```



**Don't use each for enumeration :: use `map`, `select`, and `find` when appropriate in place of `each`**

-----

## Basic Class Methods and Properties

<Details>
<summary> class Startup </summary>

1. `Startup#name`

  - returns a **string** that is the startup's name

```ruby

        def name
            @name
        end

        ## OR

        attr_reader :name

```

2. `Startup#founder`

  - returns a **string** that is the founder's name
  - Once a startup is created, the founder cannot be changed.

```ruby

        def founder
            @founder
        end

        ## OR

        attr_reader :founder

```

3. `Startup#domain`

  - returns a **string** that is the startup's domain
    - Startup#pivot has a Special Clause: Startup#pivot is the only public method through which the domain should be changed.

```ruby

        def domain
            @domain
        end

        ## OR

        attr_reader :domain

```

## All of The above code can be written more formally like so:
### storing the variables in accessor because we aren't required to restrict permissions.

```ruby

        attr_reader :founder
        attr_accessor :domain, :name

        def initialize(name, founder)
            @name = name
            @founder = founder
        end

```

4. `Startup#pivot`
  given a string of a **domain** and a string of a **name**, change the domain and name of the startup. This is the only public method through which the domain should be changed.

* Consider the following:

 ```ruby

    facebook = Startup.new("facebook", "Mark Zuckerberg")

    Instagram = Startup.new("instagram", "Kevin Systrom")

```

* If we type the following command in binding.pry:

```ruby

    facebook.pivot("dominoe", "Jon")

```

* The current domain(nil) and name("facebook"):

```zsh

    [#<Startup:0x00007fb165947de8 @founder="Mark Zuckerberg", @name="facebook">]

```

* Should change to this:

```zsh
    [#<Startup:0x00007fc5f21b5ca0 @domain="dominoe", @founder="Mark Zuckerberg", @name="Jon">]

```

* final code can be written like this

```ruby
    def pivot(domain, name)         # When Startup.new is called then:
        @domain = domain            # set @domain value to the supplied domain
        @name = name                # set @name value to the supplied name
    end
```

5. `Startup.all`
  should return **all** of the startup instances

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

6. `Startup.find_by_founder`
  given a string of a **founder's name**, returns the **first startup** whose founder's name matches

```ruby

    def self.find_by_founder(founder_name)  #Calls current class, and takes a string
        self.all.find do |startup|          # Iterates through @@all
            startup.founder == founder_name 
            # Checks if the <Class> stored in the <Array> .all has an @name that has the same value as as founder_name, then returns the first object to meet that condition.
        end
    end

```

7. `Startup.domains`
  should return an **array** of all of the different startup domains

```ruby

    def self.domains
        # We want to go into @@all and iterate through each object and then:
        self.all.map { |startup|    # 1. store each element of .all into startup
         startup.domain             # 2. return each object of instance variable :domain and store it into an array
        }.uniq                      # 3. Then we are going to filter out the duplicates of return <Array>
    end

```

</Details>

<Details>
<summary> class Venture_Capitalist</summary>

1. `VentureCapitalist#name`

  - returns a **string** that is the venture capitalist's name

```ruby

        def name
            @name
        end

        ## OR

        attr_reader :name

```

2. `VentureCapitalist#total_worth`

  - returns a **number** that is the total worth of this investor (e.g., think of it as how much money they have)

```ruby

        def total_worth
            @total_worth
        end

        ## OR

        attr_reader :total_worth

```


### All of The above code can be written more formally like so:
#### storing the variables in accessor because we aren't required to restrict permissions.

```ruby

    attr_accessor :name, :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
    end
```

3. `VentureCapitalist.all`

  - returns an array of all venture capitalists

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

4. `VentureCapitalist.tres_commas_club`

  - returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)


```ruby
    def self.tres_commas_club
        # iterates through @@all and stores each element into the venture_capitalist variable
        self.all.select do |venture_capitalist|
            venture_capitalist.total_worth > 1000000000
            # Checks if the instance of <Class: VentureCapitalist> has a total_worth that is greater than 1000000000
        end
    end

```

</Details>

<Details>

<summary> Class Funding Round </summary>
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

</Details>

----

## Associations and Aggregate Methods