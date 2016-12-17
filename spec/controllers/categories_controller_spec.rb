require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do

  render_views

  describe "GET show" do
    it "can show all posts on a categorie" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      a_post = Post.create(user: eileen, message: "Hello world ! How are you ? Check it out", url: "http://www.nodejs.com/my-url/", category_ids: categorie.id)
      sign_in eileen

      get :show, params: { id: categorie.id }

      expect(response.body).to include("#{categorie.name}")
      expect(response.body).to include("#{a_post.message}")

    end
  end
end
