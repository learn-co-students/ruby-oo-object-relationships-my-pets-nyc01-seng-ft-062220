require 'pry'
class Owner

  attr_reader :name, :species

  @@all = []
  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
     self.all.clear
  end

  def cats
    Cat.all.select do |kitties|
      kitties.owner == self
    end
  end

  #his method will return an array of dog objects associated with this owner
  def dogs
    Dog.all.select do |doggies|
      doggies.owner == self
    end
  end

  def buy_cat(cat_name)
      cat_name = Cat.new(cat_name)
      cat_name.owner = self
  end

  def buy_dog(dog_name)
    dog_name = Dog.new(dog_name)
    dog_name.owner = self
  end


  def walk_dogs
    self.dogs.each do |x|
      x.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |x|
      x.mood = "happy"
    end
  end

  ##iterate over all of the dogs and cats this owner owns and chan
  def sell_pets
    self.dogs.each do |pets|
     pets.mood = "nervous"
     pets.owner = nil
    end
    self.cats.each do |pets|
      pets.mood = "nervous"
      pets.owner = nil
    end
  end

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end

# jake = Owner.new("Jake")
# # cowie = Cat.new("cowie", "Jake")
# bowie = Dog.new("bowie", "Jake")

# jake.buy_dog("bowie")
# jake.buy_cat("cowie")
# binding.pry
# 0