class FriendshipsController < ApplicationController
	
	def index
		@user = User.find(params[:id]) || current_user
		@user.friends
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
		@friendship.destroy
	end

end