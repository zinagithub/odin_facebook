module ApplicationHelper
	def alerts
		alert = flash[:alert] || flash[:error] || flash[:notice]
		if alert 
			alert_generator alert 
		end
	end

	def alert_generator alert 
		js extend_gritter position: :bottom_right
		js add_gritter(alert, title: "Notification", time: 4000)
	end

	def notification
		unless current_user.pending_friends.count == 0
			link_to 'Notifications', friend_requests_path, class: "nav-link"
        end
	end

	def friendship_button_for user
		if current_user.friends.include?(user)
			render 'shared/cancle_friendship', user: user
		elsif current_user.pending_friends.include?(user)
			link_to 'Pending friend', friend_requests_path, class: "btn btn-outline-primary pending-friend"
		elsif current_user.friends_requested.include?(user)
			render 'shared/cancle_request', user: user
		else
			render 'shared/send_request', user: user
		end
	end
	
end
