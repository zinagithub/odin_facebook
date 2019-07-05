class PostPolicy < ApplicationPolicy
  def destroy?
    record.user == user
  end

  def edit?
  	record.user == user
  end 
end