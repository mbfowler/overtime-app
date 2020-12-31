require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Dreamboat", last_name: "Annie")
      @post = Post.create(user_id: user.id, date: Date.today, rationale: "Anything")
    end
    
    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without a date or rationale" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
