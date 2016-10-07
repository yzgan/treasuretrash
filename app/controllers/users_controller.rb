class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = User.find(current_user.id)
  	if @user.update(user_params)
  		bypass_sign_in(@user)
  		redirect_to root_path
  	else 
  		render "edit"
  	end
  end


  private
  def user_params
  	params.require(:user).permit(:password, :password_confirmation)
  end

end