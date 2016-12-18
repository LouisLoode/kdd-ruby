require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  render_views

  describe "GET index" do
    it "if not logged" do
      get :main

      expect(response).to redirect_to(root_path)
    end
    it "if logged get main" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      sign_in eileen
      get :index

      expect(response).to redirect_to(main_path)
    end
  end
end
