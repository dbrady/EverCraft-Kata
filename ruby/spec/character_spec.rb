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
  
end

