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

    it "rolls attack die and checks against opponent AC" do
      die = mock(Die)
      Die.stub!(:new).and_return die
      die.should_receive(:roll).and_return 10
      opponent.should_receive(:armor).and_return 10
      character.attack opponent
    end
  end
  
end

