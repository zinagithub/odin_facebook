module PostsHelper
	def edit_post  post
		if policy(post).destroy?
	    	link_to fa_icon("edit"), edit_post_path(post), class: "text-dark align-middle my-btn"
	    end
	end

	def delete_post post 
		if policy(post).destroy?
	    	link_to fa_icon("trash"), post, method: :delete, data: { confirm: 'Are you sure?' }, class: "text-dark align-middle my-btn"
	    end
	end

	def image post 
		unless post.image.length == 0
	    	image_tag post.image.to_s, class: "card-img-top", height:'300px'
	 	end
	end
	
end
