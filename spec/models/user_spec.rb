require "spec_helper"

RSpec.describe User, :type => :model do

  it "can be saved" do
    user = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")
    user.save!

    found = User.last
    expect(found.name).to eq("Mordecai")
    expect(found.email).to eq("m@rshow.com")
  end

  it "requires a name, password and an email" do
      user = User.new
      expect(user.valid?).to eq(false)

      user.name = "RigbyMacaca"
      expect(user.valid?).to eq(false)

      user.password = "bouboubou"
      user.password_confirmation = "bouboubou"
      expect(user.valid?).to eq(false)

      user.email = "r@rshow.com"
      expect(user.valid?).to eq(true)
    end

  it "can be edited" do
    user = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")
    user.save!
    user.update(name: "Mordecai", email: "m@rshow.com", password: "testtest", github: "http://github.com/mordecai", website: "http://www.mordecai.fr")

    expect(user.name).to eq("Mordecai")
    expect(user.email).to eq("m@rshow.com")
    expect(user.github).to eq("http://github.com/mordecai")
    expect(user.website).to eq("http://www.mordecai.fr")
  end

  it "requires a somewhat valid email" do
    user = User.new(name: "Mordecai", password: "testtest", password_confirmation: "testtest")
    expect(user.valid?).to eq(false)

    user.email = "rigby"
    expect(user.valid?).to eq(false)

    user.email = "rigby@rshow"
    expect(user.valid?).to eq(false)

    user.email = "rigby@rshow.com"
    expect(user.valid?).to eq(true)
  end

  it "is impossible to add the same email twice" do
    user = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")
    expect(user.valid?).to eq(true)

    other_user = User.create(name: "Doduda", email: "m@rshow.com", password: "proutprout", password_confirmation: "proutprout")
    expect(other_user.valid?).to eq(false)
  end
end
