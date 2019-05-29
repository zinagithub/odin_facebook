require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'default post details' do
    let(:user) { create :user }
    let(:second) { create :user }
    let(:third) { create :user }
    let(:post) { create :post }
    let(:valid_comment) { build :comment}
    let(:comment) { create :comment}

    context "Comment validations :" do
      it 'should be valid at creation ' do
        expect(valid_comment).to be_valid
      end

      it 'should be invalid without body' do
        valid_comment.body = nil
        expect(valid_comment.valid?).to be false  
      end

      it 'should be invalid without user' do
        valid_comment.user = nil
        expect(valid_comment.valid?).to be false  
      end

      it 'should be invalid without post' do
        valid_comment.post = nil
        expect(valid_comment.valid?).to be false
      end
    end  
    
  end
end