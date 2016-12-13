require "spec_helper"

RSpec.describe Relationship, :type => :model do

  it "can be saved" do
    user = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")
    user2 = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")


    relation = Relationship.new(follower_id: user.id, followed_id: user2.id)
    relation.save
    expect(relation.follower_id).to eq(user.id)
    expect(relation.followed_id).to eq(user2.id)
  end

end
