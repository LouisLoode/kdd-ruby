class UsersController < ApplicationController

  def create
    @user = User.create(email: params[:user][:email], name: params[:user][:name])
    if @user.save # L'objet est enregistré si les validations passent
      flash[:success] = "User created"
      redirect_to root_path
    else # Une validation a échouée
      flash[:error] = "Something's wrong: "
      render :new # On affiche à nouveau le formulaire de création
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
end
