class Pet
  attr_reader :health

  def initialize(name,kind)
    @name = name
    @kind = kind
    @health = 100 #pretty healthly
    @hungry = 0   #not hungry
    @asleep = 0   #don't want to sleep
    @poopy = 0    #don't want to toilet
    @mood = 100   #very happy

    puts @kind + ' ' + "\'#{@name}\'" + ' was born!'
  end

  def feed
    if hungry?
      puts 'You feed ' + @name
      @hungry = @hungry - 20
      @poopy = @poopy + 10
      @mood = @mood + 10
      @health = @health + 15 if @health < 40
      pass_of_time
    else
      puts @name + ' not hungry'
    end
    puts '---------------------------'
  end

  def long_play
    puts 'You play with ' + @name
    2.times do
      @mood = @mood + 20
      @hungry = @hungry + 10
      @asleep = @asleep + 10
    end
    sleep 0.9
    pass_of_time
    puts '---------------------------'
  end

  def quick_play
    puts 'You play with ' + @name
    @mood = @mood + 10
    @hungry = @hungry + 5
    @asleep = @asleep + 5
    pass_of_time
    puts '---------------------------'
  end

  def put_to_bed
    if @asleep < 20
      puts 'Pet don\'t want to sleep'
    else
      puts @name + ' sleep now'
      @asleep = @asleep - 20
      @hungry = @hungry + 10
    end
    pass_of_time
    puts '---------------------------'
  end

  def walk
    puts 'Now you even walk ' + @name
    @health = @health + 5
    @hungry = @hungry + 5
    @asleep = @asleep + 10
    pass_of_time
    puts '---------------------------'
  end

  def stroking
    puts 'You stroking pets back'
    @mood = @mood + 10
    @asleep = @asleep + 5
    pass_of_time
    puts '---------------------------'
  end

  def paddock
    if to_toilet?
      puts 'You even walk ' + @name + ' to toilet'
      @poopy = @poopy - 15
      @mood = @mood + 10
      @hungry = @hungry + 10
    else
      puts @name + ' don\'t want to toilet'
    end
    pass_of_time
    puts '---------------------------'
  end

  def status
    puts @name + ' status:'
    puts 'health - ' + @health.to_s
    puts 'hungry - ' + @hungry.to_s
    puts 'desire to sleep - ' + @asleep.to_s
    puts 'want to toilet - ' + @poopy.to_s
    puts 'happyness - ' + @mood.to_s
    puts '---------------------------'
    if @hungry > 50
      @hungry -= rand(20)
      puts @name + ' became more well-fed :)'
    end
    if @asleep > 50
      @asleep -= rand(10)
      puts @name + ' became more rested :)'
    end

    surprise = rand(1000)
    if (0..20).include? surprise
      puts @name + ' gone mad and run away from you. Sorry :('
      exit
    end
  end

  private

    def pass_of_time
      @hungry += rand(10)
      @poopy += rand(10)
      @asleep += rand(10)
      @mood -= rand(10)

      if @hungry > 50 || @asleep > 50
        @health -= 40
      elsif @hungry > 70 || @asleep > 70
        @health -= 60
      end

      if die?
        puts 'Sorry, but your ' + @kind + ' ' + @name + ' was dead. Try again :('
        exit
      elsif run_away?
        puts 'Sorry, but your '  + @kind + ' ' + @name + ' run away. You are bad owner >:('
        exit
      end
    end

    def die?
      @health <= 0 || @asleep >= 100 || @poopy >= 100
    end

    def run_away?
      @mood <= 5
    end

    def hungry?
      @hungry > 1
    end

    def to_toilet?
      @poopy > 35
    end
end

puts 'Create you pet!'
puts 'Type name of a pet:'
name = gets.chomp.capitalize

good_number = false

while !good_number
  puts 'Choose kind of a pet(1 - Dog, 2 - Cat, 3 - Parrot, 4 - Racoon, 5 - Ferret):'
  kind_number = gets.chomp.to_i

  if (1..5).include? kind_number
    good_number = true

    case kind_number
      when 1
        kind = 'Dog'
      when 2
        kind = 'Cat'
      when 3
        kind = 'Parrot'
      when 4
        kind = 'Racoon'
      when 5
        kind = 'Ferret'
    end
  else
    puts 'Only numbers from 1 to 5! Try again'
    puts '---------------------------'
  end
end

pet = Pet.new(name, kind)

while pet.health > 0
  puts 'Choose what you want to do with your pet:'
  puts '1 - status           | 2 - quick_play'
  puts '3 - long play        | 4 - feed'
  puts '5 - put to bed       | 6 - walk with pet'
  puts '7 - stroking the pet | 8 - walk to toilet'
  puts '9 - exit'
  puts
  action = gets.chomp.to_i
  puts
  case action
    when 0
      puts 'Unknow command'
    when 1
      pet.status
    when 2
      pet.quick_play
    when 3
      pet.long_play
    when 4
      pet.feed
    when 5
      pet.put_to_bed
    when 6
      pet.walk
    when 7
      pet.stroking
    when 8
      pet.paddock
    when 9
      exit
  end
end