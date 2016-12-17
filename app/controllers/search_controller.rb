class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    @results = Searchkick.search params[:query], index_name: [Post, Category, User]
    @query = params[:query]
    @category = false
    @post = false
    @user = false
     @results.each do |result|
       if result.class == Category
         @category = true
       elsif result.class == Post
         @post = true
       elsif result.class == User
         @user = true
       else
       end
    end
  end
end
