require "spec_helper"

RSpec.describe Category, :type => :model do

  it "can be saved" do
    categorie = Category.new(name: "Mycategorie")
    categorie.save

    expect(categorie.valid?).to eq(true)
  end

  it "have a slug before create" do
    categorie = Category.new(name: "Mycategorie")
    categorie.save

    expect(categorie.slug).to eq("mycategorie")
  end

  it "can have a description" do
    categorie = Category.new(name: "Mycategorie", description: "My nice description of my nice categorie")
    categorie.save

    expect(categorie.description).to eq("My nice description of my nice categorie")
  end

  it "need to have uniqueness name" do
    categorie = Category.new(name: "Mycategorie", description: "My nice description of my nice categorie")
    other_categorie = Category.new(name: "Mycategorie", description: "My other nice description of my nice categorie")
    categorie.save
    other_categorie.save

    expect(categorie.valid?).to eq(true)
    expect(other_categorie.valid?).to eq(false)
  end

  it "can be linked to a parent categorie" do
    categorie = Category.new(name: "MyParentCat", description: "My nice description of my nice parent categorie")
    categorie.save
    child_categorie = Category.new(name: "MyChildCat", description: "My other nice description of my nice child categorie", parent_id: categorie.id)
    child_categorie.save

    expect(categorie.parent_id).to eq(nil)
    expect(child_categorie.parent_id).to eq(categorie.id)
  end

end
