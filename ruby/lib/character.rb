class Die; end

class Character
  ALIGNMENT_GOOD = :good
  ALIGNMENT_EVIL = :evil
  ALIGNMENT_NEUTRAL = :neutral
  
  attr_accessor :name, :alignment, :armor, :hit_points

  def initialize
    @armor = 10
    @hit_points = 5
  end
  
  def alignment=(alignment)
    raise ArgumentError unless [ALIGNMENT_GOOD, ALIGNMENT_EVIL, ALIGNMENT_NEUTRAL].include? alignment
    @alignment = alignment
  end

  def attack(opponent)
    Die.new.roll > opponent.armor    
  end
  
 
  
end
