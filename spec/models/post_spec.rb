require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "needs to be linked to a user" do
    user = User.create(name: "J. G. Quintel", email: "quintel@rshow.com")
    post = Post.new(user: user, title: "Awesome Message")
    expect(post.user).to eq(user)
    expect(post.user_id).to eq(user.id)

    expect(post.valid?).to eq(true)
    post.user = nil
    expect(post.valid?).to eq(false)
  end
end
