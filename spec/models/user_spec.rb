require "spec_helper"

RSpec.describe User, :type => :model do

  it "can be saved" do
    user = User.create(name: "Mordecai", email: "m@rshow.com")
    user.save!

    found = User.last
    expect(found.name).to eq("Mordecai")
    expect(found.email).to eq("m@rshow.com")
  end
end
