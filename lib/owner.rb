require 'pry'

class Owner
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
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cat|
      cat.owner == self
    }
  end

  def dogs
    Dog.all.select{|dog|
      dog.owner == self
    }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.map! {|dog_instance| dog_instance.mood = "happy"}
  end

  def feed_cats
    cats.map! {|cat_instance| cat_instance.mood = "happy"}  
  end

  def sell_pets
    dogs.map! {|dog_instance| 
    dog_instance.owner = nil
    dog_instance.mood = "nervous"
  }
    cats.map! {|cat_instance|
    cat_instance.owner = nil
    cat_instance.mood = "nervous"
  }

  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end

#binding.pry