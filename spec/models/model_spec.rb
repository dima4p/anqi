require 'rails_helper'

describe Model, type: :model do

  subject(:model) { build :model }

  describe 'validations' do
    it { should be_valid }
  end   # validations

  describe 'class methods' do

  end   # class methods

end
