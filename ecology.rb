class Mice
  attr_accessor :number
  RATIO = 1
  LIFE_SPAN = 5

  def initialize
    @number = 30
  end

  def reproduce
    @number = @number + 1
  end

  def eaten(cats_number)
    @number = @number - cats_number * RATIO
  end

  def expire
    @number = @number * (LIFE_SPAN - 1) / LIFE_SPAN
  end
end

class Cats
  attr_accessor :number
  LIFE_SPAN = 10

  def initialize
    @number = 8
  end

  def reproduce
    @number = @number + 1
  end 

  def expire
    @number = @number * (LIFE_SPAN - 1) / LIFE_SPAN
  end 
end
  
class Grain
  attr_accessor :grams

  def initialize
    @grams = 100 
  end 

  def decrease(mice_number)
    @grams = @grams - mice_number 
  end 
end
  
class Ecology
  def initialize
    @mice = Mice.new
    @cats = Cats.new
    @grain = Grain.new
  end

  def start
    day = 0
    while true do
      @mice.reproduce
      @cats.reproduce
      @grain.decrease(@mice.number)
      @mice.eaten(@cats.number)
      @mice.expire
      @cats.expire
      day = day + 1
      break if !check_status
      puts "mice number #{@mice.number}"
      puts "cats number #{@cats.number}"
      puts "grain grams #{@grain.grams}"
    end
      puts "mice number #{@mice.number}"
      puts "cats number #{@cats.number}"
      puts "grain grams #{@grain.grams}"
  end

  def check_status
    @mice.number > 0 && @cats.number > 0 && @grain.grams >0
  end

end

eco = Ecology.new
eco.start
