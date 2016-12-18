require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  render_views

  describe "GET index" do
    it "can show user search query" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")

      sign_in eileen
      User.reindex

      get :index, params: {query: "eileen"}

      expect(response.body).to include("Utilisateurs")
      expect(response.body).to include("#{eileen.name}")

    end

    it "can show number of results and search query string" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")

      sign_in eileen
      get :index, params: {query: "rien du tout"}

      expect(response.body).to include("0")
      expect(response.body).to include("rien du tout")

    end

    it "can show post search query" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      a_post = Post.create(user: eileen, message: "Hello world ! How are you ? Check it out", url: "http://www.nodejs.com/my-url/", category_ids: categorie.id)

      sign_in eileen
      User.reindex
      Post.reindex

      get :index, params: {query: "Hello world !"}

      expect(response.body).to include("Publications")
      expect(response.body).to include("#{a_post.og_title}")

    end

    it "can show categorie search query" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")

      sign_in eileen
      Category.reindex

      get :index, params: {query: "Mycategorie"}

      expect(response.body).to include("Catégories")
      expect(response.body).to include("#{categorie.name}")

    end

    it "can't search if not logged" do
      get :index, params: {query: "Something"}

      expect(response).to redirect_to(new_user_session_path)
      expect(response.body).to_not include("Something")

    end
  end

end
