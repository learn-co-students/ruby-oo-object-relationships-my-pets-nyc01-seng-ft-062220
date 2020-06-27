class Cat
  attr_accessor :mood, :owner
  attr_reader :name
  @@all = []

  def initialize(name, owner = nil)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end
  

  #it knows all cats
  def self.all
    @@all
  end

  def count
    self.owner.count
  end

end