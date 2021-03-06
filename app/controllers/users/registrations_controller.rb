class Users::RegistrationsController < Devise::RegistrationsController
before_action :configure_sign_up_params, only: [:create]
before_action :configure_account_update_params, only: [:update]

  # def create
  #    @user = User.create(email: params[:user][:email], name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
  #    if @user.save # L'objet est enregistré si les validations passent
  #      flash[:success] = "User created"
  #      redirect_to root_path
  #    else # Une validation a échouée
  #      flash[:error] = "Something's wrong: "
  #      render :new # On affiche à nouveau le formulaire de création
  #    end
  #  end

  # GET /resource/sign_up
  # def new
  #   super
  # end
  
  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end
# def create
#     @user = User.create(email: params[:user][:email], name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
#     if @user.save # L'objet est enregistré si les validations passent
#       flash[:success] = "User created"
#       redirect_to root_path
#     else # Une validation a échouée
#       flash[:error] = "Something's wrong: "
#       render :new # On affiche à nouveau le formulaire de création
#     end
#   end
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

protected

  # If you have extra params to permit, append them to the sanitizer.
def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
end

  # If you have extra params to permit, append them to the sanitizer.
def configure_account_update_params
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :github, :website, :biography, :email, :password, :password_confirmation, :current_passwords])
end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
