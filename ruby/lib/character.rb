class Die; end

class Character
  ALIGNMENT_GOOD = :good
  ALIGNMENT_EVIL = :evil
  ALIGNMENT_NEUTRAL = :neutral

  MIN_ATTRIBUTE_SCORE = 1
  MAX_ATTRIBUTE_SCORE = 20
  
  attr_accessor :name, :alignment, :armor_class, :hit_points, :dead
  attr_reader :strength, :intelligence, :wisdom, :dexterity, :constitution, :charisma
  
  def initialize
    @armor_class = 10
    @hit_points = 5
    @strength = @intelligence = @wisdom = @dexterity = @constitution = @charisma = 10
  end
  
  def alignment=(alignment)
    raise ArgumentError unless [ALIGNMENT_GOOD, ALIGNMENT_EVIL, ALIGNMENT_NEUTRAL].include? alignment
    @alignment = alignment
  end

  def strength=(strength)
    raise ArgumentError unless (MIN_ATTRIBUTE_SCORE..MAX_ATTRIBUTE_SCORE).include? strength
    @strength = strength
  end

  def intelligence=(intelligence)
    raise ArgumentError unless (MIN_ATTRIBUTE_SCORE..MAX_ATTRIBUTE_SCORE).include? intelligence
    @intelligence = intelligence
  end
  
  def wisdom=(wisdom)
    raise ArgumentError unless (MIN_ATTRIBUTE_SCORE..MAX_ATTRIBUTE_SCORE).include? wisdom
    @wisdom = wisdom
  end
  
  def dexterity=(dexterity)
    raise ArgumentError unless (MIN_ATTRIBUTE_SCORE..MAX_ATTRIBUTE_SCORE).include? dexterity
    @dexterity = dexterity
  end
  
  def constitution=(constitution)
    raise ArgumentError unless (MIN_ATTRIBUTE_SCORE..MAX_ATTRIBUTE_SCORE).include? constitution
    @constitution = constitution
  end
  
  def charisma=(charisma)
    raise ArgumentError unless (MIN_ATTRIBUTE_SCORE..MAX_ATTRIBUTE_SCORE).include? charisma
    @charisma = charisma
  end
  
  def attack(opponent)
    roll = attack_roll
    if roll == 20
      opponent.hit_points -= damage_roll * 2
    elsif roll > opponent.armor_class
      opponent.hit_points -= damage_roll
    end
  end

  def attack_roll
    Die.new.roll + strength_modifier
  end

  def damage_roll
    1
  end

  def dead?
    @hit_points <= 0
  end

  def strength_modifier
    ability_score_modifier_for strength
  end

  def intelligence_modifier
    ability_score_modifier_for intelligence
  end

  def wisdom_modifier
    ability_score_modifier_for wisdom
  end

  def dexterity_modifier
    ability_score_modifier_for dexterity
  end

  def constitution_modifier
    ability_score_modifier_for constitution
  end

  def charisma_modifier
    ability_score_modifier_for charisma
  end

  def ability_score_modifier_for(score)
    score / 2 - 5
  end
end

