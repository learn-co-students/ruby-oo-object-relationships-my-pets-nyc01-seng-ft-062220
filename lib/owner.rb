require 'pry'

class Owner
  attr_reader :name, :species
  attr_accessor :pets

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    p "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|c| c.owner == self }
  end

  def dogs
    Dog.all.select {|d| d.owner == self }
  end

  def buy_cat(cat)
    cat = Cat.new(cat, self)
  end

  def buy_dog(dog)
    dog = Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.each {|dog| dog.mood = "nervous"}
    self.dogs.each {|dog| dog.owner = nil}
    self.cats.each {|cat| cat.mood = "nervous"}
    self.cats.each {|cat| cat.owner = nil}
  end

  def list_pets
    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end