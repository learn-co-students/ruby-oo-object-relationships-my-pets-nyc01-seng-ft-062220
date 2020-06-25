class Owner

  attr_reader :name,:species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    Owner.all << self
  end

  def say_species
   "I am a #{@species}." 
  end

  def self.all
    @@all
  end

  def self.count
    Owner.all.length
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats
    Cat.all.select {|element| element.owner == self}
  end

  def dogs
    Dog.all.select {|element| element.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name,self)
  end

  def buy_dog(name)
    dog = Dog.new(name,self)
  end

  def walk_dogs
    Dog.all.each do |element| 
      if element.owner == self
        element.mood = "happy"
      end
    end
  end

  def feed_cats
    Cat.all.each do |element| 
      if element.owner == self
        element.mood = "happy"
      end
    end
  end

  def sell_pets
    Dog.all.each do |element| 
      if element.owner == self
        element.owner = nil
        element.mood = "nervous"
      end
    end

    Cat.all.each do |element| 
      if element.owner == self
        element.owner = nil
        element.mood = "nervous"
      end
    end
  end

  def list_pets
    cat_array = Cat.all.select {|element| element.owner == self}
    dog_array = Dog.all.select {|element| element.owner == self}
    "I have #{dog_array.length} dog(s), and #{cat_array.length} cat(s)." 
  end

end