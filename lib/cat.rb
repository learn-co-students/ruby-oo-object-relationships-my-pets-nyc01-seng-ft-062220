class Cat
  # code goes here
  attr_accessor :owner
  attr_reader :name, :mood
  @@all = []

  def initialize (name,owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end

  def mood= (string)
    @mood = string
  end

  def self.all
    @@all
  end
  



end