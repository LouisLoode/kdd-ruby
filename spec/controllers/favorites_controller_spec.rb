require 'rails_helper'

RSpec.describe FavoritesController, :type => :controller do

  render_views

  describe "POST create" do
    it "can create a favorite" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      a_post = Post.create(user: eileen, message: "Hello world ! How are you ? Check it out", url: "http://www.nodejs.com/my-url/", category_ids: categorie.id)
      user = User.create(name: "NewUser #{rand(1000)}", email: "Eildsdsdsseen@rs.com", password: "testtest", password_confirmation: "testtest")
      sign_in user

      post :create, params: { post_id: a_post.id }, xhr: true

      last_favorite = Favorite.last
      expect(last_favorite.user_id).to eq(user.id)
      expect(last_favorite.post_id).to eq(a_post.id)

    end
  end

  describe "DELETE delete" do
    it "can delete a favorite" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      a_post = Post.create(user: eileen, message: "Hello world ! How are you ? Check it out", url: "http://www.nodejs.com/my-url/", category_ids: categorie.id)
      user = User.create(name: "NewUser #{rand(1000)}", email: "Eildsdsdsseen@rs.com", password: "testtest", password_confirmation: "testtest")
      sign_in user

      post :create, params: { post_id: a_post.id }, xhr: true
      delete :delete, params: { post_id: a_post.id }, xhr: true

      last_favorite = Favorite.last
      expect(last_favorite).to eq(nil)

    end
  end
end
