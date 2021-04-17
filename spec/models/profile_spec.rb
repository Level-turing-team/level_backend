require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :zipcode }
    it { should validate_uniqueness_of :user_id }
  end

  before :each do
    @profile_1 = create(:profile)
    @profile_2 = create(:profile)
    @profile_3 = create(:profile)
    Circle.create(user_id: @profile_1.user_id, following_id: @profile_2.user_id)
    Circle.create(user_id: @profile_1.user_id, following_id: @profile_3.user_id)
    Circle.create(user_id: @profile_2.user_id, following_id: @profile_3.user_id)
    @post1 = create(:post, user_id: @profile_2.user_id)
    @post2 = create(:post, user_id: @profile_3.user_id)
    @tag1 = Tag.create(name: 'artist')
    @tag2 = Tag.create(name: 'musician')
    ProfileTag.create(user_id: @profile_1.user_id, tag_id: @tag1.id)
    ProfileTag.create(user_id: @profile_1.user_id, tag_id: @tag2.id)
  end

  describe "class methods" do
    describe "#friends" do
      it "should return all profile friends" do
        expect(Profile.friends(@profile_1.user_id)).to eq([@profile_2, @profile_3])
      end
    end

    describe "#circle_posts" do
      it "should return all profile friends posts" do
        expect(Profile.circle_posts(@profile_1.user_id)).to eq([@post1, @post2])
      end
    end
  end

  describe "instance method" do
    describe "#tags" do
      it "should return all profile tags" do
        expect(@profile_1.tags).to eq([@tag1, @tag2])
      end
    end
  end
end
