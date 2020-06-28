class Owner
  #attr_accessor
  attr_reader :name, :species
  @@all = []
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def cats
    Cat.all.select do |cat_object|
      cat_object.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog_object|
      dog_object.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog_object|
      dog_object.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat_object|
      cat_object.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog_object|
      dog_object.mood = "nervous"
      dog_object.owner = nil
    end
    self.cats.each do |cat_object|
      cat_object.mood = "nervous"
      cat_object.owner = nil
    end
    Owner.reset_all
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end
end