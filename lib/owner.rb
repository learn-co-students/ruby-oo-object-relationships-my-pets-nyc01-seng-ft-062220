require 'pry'

class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name, species='human')
    @species = species
    @name = name
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|kitty|kitty.owner == self}
  end

  def dogs
    Dog.all.select {|puppy|puppy.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self, )
  end

  def buy_dog(name)
    Dog.new(name, self, )
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    Cat.all.each {|kitty| kitty.mood = 'happy'}
  end

  def sell_pets
    Cat.all.each {|kitty| kitty.mood = 'nervous'}
    Dog.all.each {|puppy| puppy.mood = 'nervous'}

    Cat.all.each {|kitty| kitty.owner = nil}
    Dog.all.each {|puppy| puppy.owner = nil}
  end

  def list_pets
    cats = Cat.all.select {|kitty| kitty.owner == self}
    dogs = Dog.all.select {|puppy| puppy.owner == self}
    cats_total = cats.length
    dogs_total = dogs.length

    return "I have #{dogs_total} dog(s), and #{cats_total} cat(s)."

  end

end