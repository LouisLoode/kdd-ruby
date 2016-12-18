require 'rails_helper'

RSpec.describe RatesController, :type => :controller do

  render_views

  describe "POST create" do
    it "can create a Rates" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      a_post = Post.create(user: eileen, message: "Hello world ! How are you ? Check it out", url: "http://www.nodejs.com/my-url/", category_ids: categorie.id)
      user = User.create(name: "NewUser #{rand(1000)}", email: "Eildsdsdsseen@rs.com", password: "testtest", password_confirmation: "testtest")
      sign_in user

      post :create, params: { post_id: a_post.id, score: 4 }, xhr: true

      last_rate = Rate.last
      expect(last_rate.user_id).to eq(user.id)
      expect(last_rate.post_id).to eq(a_post.id)
      expect(last_rate.score).to eq(4)
    end

    it "can't create rate if is user own post" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      a_post = Post.create(user: eileen, message: "Hello world ! How are you ? Check it out", url: "http://www.nodejs.com/my-url/", category_ids: categorie.id)
      sign_in eileen

      post :create, params: { post_id: a_post.id, score: 2}, xhr: true

      last_rate = Rate.last
      expect(last_rate).to eq(nil)
    end
  end
end
