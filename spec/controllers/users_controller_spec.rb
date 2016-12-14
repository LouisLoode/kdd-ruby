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
end
