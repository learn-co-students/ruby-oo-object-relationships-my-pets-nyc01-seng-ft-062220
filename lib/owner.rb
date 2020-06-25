require "pry"

class Owner
  attr_reader :name, :species
  @@all = []
  @@count = 0

  def initialize (name)
    @name = name
    @species = "human"

    @@all << self
    @@count += 1
    #binding.pry
  end

  def say_species
    "I am a #{@species}."
  end


  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    #binding.pry
    @@all.clear
    @@count = 0
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat (name)
    Cat.new(name, self)
  end

  def buy_dog (name)
    Dog.new(name, self)
  end

  def walk_dogs
    #binding.pry
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    #binding.pry
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    cats.each {|cat| cat.mood = "nervous"}
    dogs.each {|dog| dog.mood = "nervous"}
    cats.each {|cat| cat.owner = nil}
    dogs.each {|dog| dog.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end



