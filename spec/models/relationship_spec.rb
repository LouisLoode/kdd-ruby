require "spec_helper"

RSpec.describe Relationship, :type => :model do

  it "can be saved" do
    user = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")
    user2 = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")


    relation = Relationship.new(followed_id: user.id, follower_id: user2.id)
    expect(relation.valid?).to eq(true)
  end

end
