
Run this when we need to check something:

```zsh
 ruby tools/console.rb
```

----

**Don't use each for enumeration :: use `map`, `select`, and `find` when appropriate in place of `each`**

## class Venture_Capitalist

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


## All of The above code can be written more formally like so:
### storing the variables in accessor because we aren't required to restrict permissions.


```ruby
    attr_reader :name, :total_worth

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

<Details>
<summary> Final Code </summary>

``` ruby
    attr_reader :name, :total_worth
    
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |venture_capitalist|
            venture_capitalist.total_worth > 1000000000 
        end
    end

```
</Details>