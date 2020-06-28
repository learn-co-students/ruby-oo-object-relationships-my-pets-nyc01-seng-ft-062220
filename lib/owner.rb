class Owner

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    # Optional: Can remove getter species and interpolate @species
    "I am a #{self.species}."
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

  # Finder Helper Method

  # Associations to other class objections via owner instance methods

  def cats
    Cat.all.select { |cat_inst| cat_inst.owner == self }
  end

  def dogs
    Dog.all.select { |dog_inst| dog_inst.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each { |dog_inst| dog_inst.mood = "happy" }
  end

  def feed_cats
    cats.each { |cat_inst| cat_inst.mood = "happy" }
  end

  def sell_pets
    pets = cats + dogs

    pets.each do |pet_inst| 
      pet_inst.mood = "nervous" 
      pet_inst.owner = nil 
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end