module CommentsHelper
	def delete_comment  comment
		if policy(comment).destroy?
	    	link_to 'X', comment, method: :delete, data: { confirm: 'Are you sure?' }, class: 'text-danger'
	    end
	end
end
