require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "can be create" do
    user = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")
    categorie = Category.create(name: "Mycategorie")
    post = Post.new(user_id: user.id, message: "Awesome Message", url: "http://www.google.com", category_ids: categorie.id)
    post.save

    expect(post.user).to eq(user)
    expect(post.user_id).to eq(user.id)

    expect(post.valid?).to eq(true)
    post.user = nil
    expect(post.valid?).to eq(false)
  end

  it "can have 250 caracteres max" do
    text = "Lorem"
    user = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")
    categorie = Category.create(name: "Mycategorie")
    post = Post.new(user_id: user.id, message: text, url: "http://www.google.com", category_ids: categorie.id)

    expect(post.valid?).to eq(true)

    text = "Formation Grande école : Formation comprenant des périodes de cours intensives, des prestations web réelles et l’élaboration d’un business plan en 5e année. Au terme du cursus, HETIC délivre le titre d’« expert(e) en ingénierie de la communication numérique » certifié de niveau I reconnu par l’État.
Bachelor Web : Formation en 3 ans, dont 2 ans en alternance, s’adressant aux futurs développeurs web et mobile et aux futurs webdesigners.
Bachelor 3D : Formation en 3 ans d'infographistes 3D ayant les compétences nécessaires à la conception et la réalisation d’un projet 3D temps réel.
Bachelor Webmarketing : Formation de spécialistes répondant aux besoins grandissants du marché dans les domaines du e-marketing et des réseaux sociaux.
M.B.A : Ebusiness et management : Formation en 6 mois aux problématiques d’e-business, d’e-commerce et d’e-marketing. Le but est d'assurer une insertion professionnelle dans l’industrie du digital. Les étudiants sont sanctionnés d’un diplôme d’« expert en stratégie digitale » certifié de niveau I et reconnu par l’État. "
    post = Post.new(user_id: user.id, message: text, url: "http://www.google.com", category_ids: categorie.id)

    expect(post.valid?).to eq(false)
  end

  it "needs to be linked to a user" do
    user = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")
    categorie = Category.create(name: "Mycategorie")
    post = Post.new(user: user, message: "Awesome Message", url: "http://www.google.com", category_ids: categorie.id)
    expect(post.user).to eq(user)
    expect(post.user_id).to eq(user.id)

    expect(post.valid?).to eq(true)
    post.user = nil
    expect(post.valid?).to eq(false)
  end

  it "needs to have valid url" do
    user = User.create(name: "Mordecai", email: "m@rshow.com", password: "testtest", password_confirmation: "testtest")
    categorie = Category.create(name: "Mycategorie")
    url = "google.groundzq"
    post = Post.new(user: user, message: "Awesome Message", url: url, category_ids: categorie.id)
    expect(post.valid?).to eq(false)
    post.url = "ftp://hackme.com"
    expect(post.valid?).to eq(false)
    post.url = "https://google.fr"
    expect(post.valid?).to eq(true)
  end

end
