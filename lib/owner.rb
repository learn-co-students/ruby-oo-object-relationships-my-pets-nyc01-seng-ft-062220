class Owner
  # code goes here
  attr_reader :name, :species 

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self 
  end 

  def say_species
    "I am a #{@species}."
  end 

  def self.all
    @@all
  end 

  def self.count 
    self.all.size
  end 

  def self.reset_all
    self.all.clear
  end 

  def cats 
    Cat.all.find_all do |element|
      element.owner == self 
    end 
  end 

  def dogs 
    Dog.all.find_all do |element|
      element.owner == self
    end 
  end 

  def buy_cat(name_of_cat)
    Cat.new(name_of_cat, self)
  end 

  def buy_dog(name_of_dog)
    Dog.new(name_of_dog, self)
  end 

  def walk_dogs
    Dog.all.map do |element|
      element.mood = "happy"
    end 
  end 

  def feed_cats
    Cat.all.map do |element|
      element.mood = "happy"
    end 
  end 

  def sell_pets
    Cat.all.map do |element|
      element.mood = "nervous"
      element.owner = nil 
    end 
    Dog.all.map do |element|
      element.mood = "nervous"
      element.owner = nil
    end 
  end 

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
end