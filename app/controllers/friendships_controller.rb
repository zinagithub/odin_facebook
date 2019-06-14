class FriendshipsController < ApplicationController
	
	def index
		if params[:id]
			@user = User.find(params[:id])
		else
			@user = current_user
		end
		@friends = @user.friends
	end 

	def create
		@friendship = current_user.friendships.build(friend_id: params[:friend_id])
		if @friendship.save
		   flash[:notice] = "Friend was successfully added."
		else
		   flash[:error] = "Friend could not be added."
		end
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@friendship = Friendship.find(params[:id])
		if @friendship.friend == current_user
			@user = @friendship.user
		else
			@user = @friendship.friend
		end
		@friendship.destroy
		respond_to do |format|
	      format.html { redirect_to friend_requests_path }
	      format.js
	    end
	end

end