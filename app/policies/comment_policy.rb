class CommentPolicy < ApplicationPolicy
  def destroy?
    record.user == user
  end
  
end