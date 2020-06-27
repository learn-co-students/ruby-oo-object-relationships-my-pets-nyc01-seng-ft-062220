require 'pry'
class Owner
  attr_reader :name, :species, :owner
  @@owners = [] #store all owners

  # code goes here
  def initialize(name)
    @name = name
    @species = "human"
    @@owners << self #another way of saying @@owner << self
  end

  def say_species
    p "I am a human."
  end

  def self.all
   @@owners
  end

  def self.count
    @@owners.count
  end

  def self.reset_all
    @@owners = []
  end

  def cats #all cats belonging to this owner
    Cat.all.select {|each| each.owner == self}
  end

  def dogs
    Dog.all.select {|each| each.owner == self}
  end

    #As self we are buying a new/existing cat! re-call that cats can have muliiple owners!
  #We can make a new instance for this cat and provide it this self as its other owner
  def buy_cat(cat_name)  
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)  
    Dog.new(dog_name, self)
  end

  def walk_dogs #this owner walking all of his/her dogs
    dogs.map do |dog| #dogs was def above, return list of dogs matching this owner moods all set to 'happy'
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.map {|cat| cat.mood = "happy"}
  end

  #can sell all self pets, also sets moods to nervous 
  #also defaults these pets to have nil as owner

  def pets #helper method to give me a list of all pets for self
    all_pets = cats + dogs
  end
  
  def sell_pets #using list of both dogs/cats for self, set moods & owner
    pets.map do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    p  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

#owner1 = Owner.new("Timmy")
#dog = Dog.new("Daisy", owner1)
#dog2 = Dog.new("Boob", owner1)
#cat1 = Cat.new("White", owner1)
#cat2 = Cat.new("Jam", owner1)
#owner1.feed_cats
#owner1.walk_dogs

#owner1.sell_pets

#binding.pry