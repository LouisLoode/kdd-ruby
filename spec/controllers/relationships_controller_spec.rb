require 'rails_helper'

RSpec.describe RelationshipsController, :type => :controller do

  render_views

  describe "POST create" do
    it "can create a relationship" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      user = User.create(name: "NewUser #{rand(1000)}", email: "Eildsdsdsseen@rs.com", password: "testtest", password_confirmation: "testtest")
      sign_in user

      post :create, params: { followed_id: eileen }, xhr: true

      last_relation = Relationship.last
      expect(last_relation.follower_id).to eq(user.id)
      expect(last_relation.followed_id).to eq(eileen.id)
    end
  end

  describe "DELETE delete" do
    it "can delete a relationship" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      user = User.create(name: "NewUser #{rand(1000)}", email: "Eildsdsdsseen@rs.com", password: "testtest", password_confirmation: "testtest")
      sign_in user

      post :create, params: { followed_id: eileen }, xhr: true
      delete :destroy, params: { followed_id: eileen }, xhr: true

      last_relation = Relationship.last
      expect(last_relation).to eq(nil)

    end
  end
end
