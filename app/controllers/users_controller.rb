class UsersController < ApplicationController

	before_action :set_user, only: [:show, :friends]

	def index
		@users = User.all
	end

	def show
		@posts = @user.posts
	end

	def friends
		@friends = @user.friends
	end 

	private 

	def set_user
		@user = User.find(params[:id])
	end
end
