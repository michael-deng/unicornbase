class CategoryRegistrationsController < ApplicationController

	before_action :authenticate_user!

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update_attributes(user_params)
      flash[:success] = "Interests updated!"
      redirect_to ideas_path
    else
    	flash.now[:error] = "There was an error with your update. Please try again."
      render 'edit'
    end
  end

  	private

  	def user_params
      params.require(:user).permit(:category_ids => [])
    end
end
