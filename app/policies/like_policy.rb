class LikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    !record.post.likes.find_by(user_id: user.id).present? && record.post.user != user
  end

  def destroy?
    record.post.likes.find_by(user_id: user.id).present?
  end
end
