class UserProfileController < ApplicationController
  before_action :set_user_profile
  
  def show
  end
  # Allows for the alteration of a users profile
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to user_profile_show_path, notice: "user_profile was successfully updated." }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private
  # Sets a user profile for the logged in user
  def set_user_profile
    @user_profile = current_user.user_profile
  end
  # Provides required parameters from the user profile to the user
  def user_profile_params
    params.require(:user_profile).permit(:first_name, :last_name)
  end
end