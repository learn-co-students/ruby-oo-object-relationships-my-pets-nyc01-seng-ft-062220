class Cat
  @@all=[]
  attr_reader :name
  attr_accessor :mood, :owner
def initialize(name, owner)
@owner=owner
  @name=name
  @mood="nervous"
  @@all << self
end 
def self.all 
  @@all 
end


end 