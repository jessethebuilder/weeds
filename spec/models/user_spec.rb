require 'spec_helper'

describe User do
  let(:user){ build :user }

  describe 'Associations' do
    it{ should have_many :orders }
  end

  describe 'Validations' do
    it{ should validate_presence_of :password }
    it{ should validate_presence_of :email }
    it{ should validate_uniqueness_of :email }
  end

  describe 'Methods' do
  end
end