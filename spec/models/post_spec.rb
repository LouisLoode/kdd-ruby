require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "can be create" do
    user = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")
    categorie = Category.create(name: "Mycategorie")
    post = Post.create(user_id: user.id, message: "Awesome Message", url: "http://www.google.com", category_ids: 1)
    
    expect(post.user).to eq(user)
    expect(post.user_id).to eq(user.id)

    expect(post.valid?).to eq(true)
    post.user = nil
    expect(post.valid?).to eq(false)
  end
end
