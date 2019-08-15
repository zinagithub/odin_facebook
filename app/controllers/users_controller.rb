class UsersController < ApplicationController

	before_action :set_user, only: [:show, :friends]

	def index
		if params[:search]
			@users = User.where('name LIKE ?', "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
		else 
			@users = User.all.paginate(page: params[:page], per_page: 10)
		end
	end

	def show
  		@posts = @user.posts
  		@friends = @user.friends[0..5]
	end

	private 

	def set_user
		@user = User.find(params[:id])
	end
end
