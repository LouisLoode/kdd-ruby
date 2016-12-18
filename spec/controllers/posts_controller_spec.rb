require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  render_views

  describe "POST create" do
    it "can create a post" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      sign_in eileen

      post :create, params: { post: { message: "Hello yall!!!!! why not", url: "http://www.nodejs.com/test/", category_ids: [categorie.id] }}

      expect(response).to redirect_to(show_profile_path)
      last_post_created = Post.last
      expect(last_post_created.message).to eq("Hello yall!!!!! why not")
    end
  end

  describe "GET show" do
    it "displays the post details without logged" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      a_post = Post.create(user: eileen, message: "Hello", url: "http://nodejs.com", category_ids: categorie.id)

      get :show, params: {id: a_post.id}

      expect(response).to have_http_status(:success)
      expect(response.body).to include("#{eileen.name}")
      expect(response.body).to include("##{categorie.slug}")
      expect(response.body).to include("#{a_post.message}")
      expect(response.body).to include("#{a_post.url}")
    end
  end

  describe "GET edit" do
    it "can edit a saved post if post is owned by current_user" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      a_post = Post.create(user: eileen, message: "Hello", url: "http://nodejs.com", category_ids: categorie.id)
      sign_in eileen

      get :edit, params: {id: a_post.id}

      expect(response).to have_http_status(:success)
      expect(response.body).to include("Modifier cette publication")
      expect(response.body).to include("#{a_post.url}")
      expect(response.body).to include("#{a_post.message}")

      sign_out eileen

      get :edit, params: {id: a_post.id}

      expect(response.body).to_not include("Modifier cette publication")
    end

    it "can't edit a post if post is not owned by current_user" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      a_post = Post.create(user: eileen, message: "Hello", url: "http://nodejs.com", category_ids: categorie.id)
      user = User.create(name: "NewUser #{rand(1000)}", email: "Eildsdsdsseen@rs.com", password: "testtest", password_confirmation: "testtest")
      sign_in user

      get :edit, params: {id: a_post.id}

      expect(response).to redirect_to(main_path)
      expect(response.body).to_not include("Modifier cette publication")
      expect(response.body).to_not include("#{a_post.url}")
      expect(response.body).to_not include("#{a_post.message}")
    end
  end

  describe "PUT update" do
    it "can update a saved post" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      categorie = Category.create(name: "Mycategorie")
      a_post = Post.create(user: eileen, message: "Hello", url: "http://nodejs.com", category_ids: categorie.id)
      sign_in eileen

      patch :update, params: {id: a_post.id, post: {message: "Hi, this is my new post edited"}}

      a_post.reload
      expect(a_post.message).to include("Hi, this is my new post edited")
    end
  end

  describe "GET new" do
    it "can send a new post if sign_in" do
      eileen = User.create(name: "Eileen #{rand(1000)}", email: "Eileen@rs.com", password: "testtest", password_confirmation: "testtest")
      sign_in eileen
      get :new

      expect(response).to have_http_status(:success)
      expect(response.body).to include("Poster une ressource")
    end
    it "can't send a new post if not logged" do
      get :new

      expect(response).to have_http_status(302)
      expect(response.body).to_not include("Poster une ressource")
    end
  end


end
