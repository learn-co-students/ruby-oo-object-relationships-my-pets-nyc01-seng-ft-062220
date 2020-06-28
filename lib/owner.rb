class Owner
  # code goes here

  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end


  def say_species
   "I am a #{@species}."
  end

  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|i| i.owner == self}
  end

  def dogs
    Dog.all.select{|i| i.owner == self}
  end

  def buy_cat(string)
    Cat.new(string,self)
  end

  def buy_dog(string)
    Dog.new(string,self)
  end

  def walk_dogs
    dogs.each{|i| i.mood = "happy"}
  end

  def feed_cats
    cats.each{|i| i.mood = "happy"}
  end

  def sell_pets
   
      cats.each do |i| 
        i.mood = "nervous" 
         i.owner = nil 
        end
      dogs.each do |i| 
        i.mood = "nervous"  
        i.owner = nil 
      end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end




end