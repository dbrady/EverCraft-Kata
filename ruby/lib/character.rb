class Die; end

class Character
  ALIGNMENT_GOOD = :good
  ALIGNMENT_EVIL = :evil
  ALIGNMENT_NEUTRAL = :neutral
  
  attr_accessor :name, :alignment, :armor, :hit_points, :dead

  def initialize
    @armor = 10
    @hit_points = 5
  end
  
  def alignment=(alignment)
    raise ArgumentError unless [ALIGNMENT_GOOD, ALIGNMENT_EVIL, ALIGNMENT_NEUTRAL].include? alignment
    @alignment = alignment
  end

  def attack(opponent)
    roll = Die.new.roll
    if roll == 20
      opponent.hit_points -= 2
    elsif roll > opponent.armor
      opponent.hit_points -= 1
    end
  end

  def dead?
    @hit_points <= 0
  end
end

