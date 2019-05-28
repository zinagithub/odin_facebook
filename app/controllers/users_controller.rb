class UsersController < ApplicationController

	before_action :set_user, only: [:show]

	def index
		@users = User.all
	end

	def show
		@posts = User.posts
	end

	private 

	def set_user
		@user = User.find(params[:id])
	end
end
