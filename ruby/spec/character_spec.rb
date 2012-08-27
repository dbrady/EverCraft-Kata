require 'spec_helper'
require 'character'

describe Character do
  Given(:character) { Character.new }

  describe "#name" do
    When { character.name = 'Bilbo' }
    Then { character.name.should == 'Bilbo' }
  end

  describe "#alignment" do
    [Character::ALIGNMENT_EVIL, Character::ALIGNMENT_GOOD, Character::ALIGNMENT_NEUTRAL].each do |alignment|
      When { character.alignment = alignment }
      Then { character.alignment == alignment }
    end

    context "with invalid alignment" do
      it "raises ArgumentError" do
        lambda { character.alignment = :pigtruck }.should raise_error(ArgumentError)
      end
    end
  end

  describe "#armor" do
    Then { character.armor.should == 10 }
  end
  
  describe "#hit_points" do
    Then { character.hit_points.should == 5 }
  end

  describe "#attack" do
    Given(:opponent) { Character.new }
    Given(:die) { mock(Die) }
    Given do
      Die.stub!(:new).and_return die
    end
    
    context "when attack hits" do
      Given do
        die.stub!(:roll).and_return 11
      end
      
      it "rolls attack die and checks against opponent AC" do
        die.should_receive(:roll).and_return 11
        opponent.should_receive(:armor).and_return 10
        character.attack opponent
      end

      it "damages opponent by 1 hp" do
        lambda { character.attack opponent }.should change(opponent, :hit_points).by -1
      end

      it "does not damage the attacker" do
        lambda { character.attack opponent }.should_not change(character, :hit_points)
      end
    end

    context "when attack misses" do
      Given do
        die.stub!(:roll).and_return 10
      end

      it "does not damage opponent" do
        lambda { character.attack opponent }.should_not change(opponent, :hit_points)
      end
    end

    context "when attack is a critical hit" do
      Given do
        die.stub!(:roll).and_return 20
      end

      it "does double damage (2) to opponent" do
        lambda { character.attack opponent }.should change(opponent, :hit_points).by -2
      end
    end
  end

  describe "#dead?" do
    context "when hp > 0" do
      Then { character.should_not be_dead }
    end
    context "when hp == 0" do
      When { character.hit_points = 0 }
      Then { character.should be_dead }
    end
    context "when hp < 0" do
      When { character.hit_points = -4 }
      Then { character.should be_dead }
    end
  end
end

