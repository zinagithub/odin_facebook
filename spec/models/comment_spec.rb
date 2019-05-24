require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'default post details' do
    let(:user) { create :user }
    let(:second) { create :user }
    let(:third) { create :user }
    let(:post) { create :post }
    let(:comment) { create :comment}


    it 'should be valid at creation ' do
       expect(comment.valid?).to be true
    end

    it 'should be invalid without body' do
     comment.body = nil
     expect(comment.valid?).to be false  
    end

    it 'should be invalid without user' do
     comment.user = nil
     expect(comment.valid?).to be false  
    end

    it 'should be invalid without post' do
      comment.post = nil
      expect(comment.valid?).to be false
    end
  end
end