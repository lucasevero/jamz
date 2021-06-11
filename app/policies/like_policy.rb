class LikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    false if record.post.likes.find_by(user_id: user.id).present?
    false if record.post.user == user
  end
end
