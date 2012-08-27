class Character
  ALIGNMENT_GOOD = :good
  ALIGNMENT_EVIL = :evil
  ALIGNMENT_NEUTRAL = :neutral
  
  attr_accessor :name, :alignment, :armor

  def initialize
    @armor = 10
  end
  
  def alignment=(alignment)
    raise ArgumentError unless [ALIGNMENT_GOOD, ALIGNMENT_EVIL, ALIGNMENT_NEUTRAL].include? alignment
    @alignment = alignment
  end

 
  
end
