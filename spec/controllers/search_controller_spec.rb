require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  render_views

  describe "GET index" do
    it "can show search query" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      a_post = Post.create(user: eileen, message: "Hello world ! How are you ? Check it out", url: "http://www.nodejs.com/my-url/", category_ids: categorie.id)

      sign_in eileen
      User.reindex
      
      get :index, params: {query: "eileen"}

      expect(response.body).to include("Utilisateurs")
      expect(response.body).to include("#{eileen.name}")

    end
  end

end
