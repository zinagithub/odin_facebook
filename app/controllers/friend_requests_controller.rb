class FriendRequestsController < ApplicationController
	before_action :set_friend_request, only: [:destroy, :accept]

  def index
    @friend_requests = current_user.friend_requests_received
  end

  def create
    @friend_request = current_user.friend_requests_sent.build(receiver_id: params[:receiver_id])
    if @friend_request.save
      respond_to do |format|
          format.html { redirect_back(fallback_location: root_path, notice: 'Friend request sent.') }
          format.js
        end
    else
      flash[:error] = 'Friend request could not be sent'
    end
  end

  def destroy
    @friend_request.destroy
    respond_to do |format|
      format.html { redirect_to friend_requests_path }
      format.js
    end
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:receiver_id)
  end

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end

end
