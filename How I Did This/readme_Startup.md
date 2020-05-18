Run this when we need to check something:

```zsh
 ruby tools/console.rb
```

----

**Don't use each for enumeration :: use `map`, `select`, and `find` when appropriate in place of `each`**

## class Startup

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

## All of The above code can be written more formally like so

```ruby

        attr_reader :founder,  :domain, :name

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

### What my Final Code looks like:

<Details>
<summary> Final Code</summary>

```Ruby

class Startup

    attr_reader :founder,  :domain, :name
    @@all = []

    def initialize(name, founder)
        @name = name
        @founder = founder
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.find do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        self.all.map(&:domain).uniq
    end

end

```

</Details>