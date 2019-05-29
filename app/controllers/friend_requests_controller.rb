class FriendRequestsController < ApplicationController
	before_action :set_friend_request, only: %i[update destroy]
 
  def new
  	@friend_request = FriendRequest.new
  end 
  def index
    @received_requests = current_user.pending_friends
  end

  def create
    
  end

  def update
    
  end

  def destroy
    authorize @friend_request, :destroy?
    @friend_request.destroy
    respond_to do |format|
      format.html do
        redirect_back fallback_location: root_path,
                      success: 'Friend request successfuly destroyed'
      end
      format.js
    end
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:receiver_id, :status)
  end

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end
end
