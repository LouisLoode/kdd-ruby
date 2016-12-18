require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  render_views

  describe "GET show" do
    it "can show a user profile" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")

      get :show, params: {id: eileen.id}

      expect(response.body).to include("#{eileen.name}")
      expect(response.body).to include("Pertinence")
      expect(response.body).to include("Followers")
    end
  end

  describe "GET followers" do
    it "can show user followers" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      user = User.create(name: "NewUser #{rand(1000)}", email: "Eildsdsdsseen@rs.com", password: "testtest", password_confirmation: "testtest")
      sign_in user

      last_relation = Relationship.create(follower_id: user.id, followed_id: eileen.id)

      expect(last_relation.follower_id).to eq(user.id)
      expect(last_relation.followed_id).to eq(eileen.id)

      get :followers, params: {id: eileen.id}

      expect(response.body).to include("#{user.name}")
    end
  end

  describe "GET followings" do
    it "can show user followings" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      user = User.create(name: "NewUser #{rand(1000)}", email: "Eildsdsdsseen@rs.com", password: "testtest", password_confirmation: "testtest")
      sign_in user

      last_relation = Relationship.create(follower_id: user.id, followed_id: eileen.id)

      expect(last_relation.follower_id).to eq(user.id)
      expect(last_relation.followed_id).to eq(eileen.id)

      get :following, params: {id: user.id}

      expect(response.body).to include("#{eileen.name}")
    end
  end
end
