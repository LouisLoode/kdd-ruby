require "spec_helper"

RSpec.describe Rate, :type => :model do

  it "can be saved" do
    rate = Rate.new(user_id: 1, post_id: 1, score: 4)
    rate.save

    expect(rate.valid?).to eq(true)
  end

  it "need to be linked to a user" do
    rate = Rate.new(post_id: 1, score: 4)

    expect(rate.valid?).to eq(false)
  end

  it "need to be linked to a post" do
    rate = Rate.new(user_id: 1, score: 4)

    expect(rate.valid?).to eq(false)
  end

  it "need to have score between 1 and 5 with step 1" do
    rate = Rate.new(user_id: 1, post_id: 1, score: 4)
    expect(rate.valid?).to eq(true)

    rate.score = nil
    expect(rate.valid?).to eq(false)

    rate.score = 1.2
    expect(rate.valid?).to eq(false)

    rate.score = "hacking ??"
    expect(rate.valid?).to eq(false)

    rate.score = 6
    expect(rate.valid?).to eq(false)
  end
end
