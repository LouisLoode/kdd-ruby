require "spec_helper"

RSpec.describe Favorite, :type => :model do

  it "can be saved" do
    user = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")
    categorie = Category.create(name: "Mycategorie")
    post = Post.create(user: user, message: "Awesome Message", url: "http://www.google.com", category_ids: categorie.id)

    favorite = Favorite.create(user_id: user.id, post_id: post.id)
    expect(favorite.valid?).to eq(true)
  end

end
