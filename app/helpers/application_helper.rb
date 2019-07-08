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
	
end
