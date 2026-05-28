class OwnerPolicy < ApplicationPolicy
  def show?
    user.admin? || user.owner? && record == user.owner
  end

  def edit?
    update?
  end

  def update?
    user.admin? || user.owner? && record == user.owner
  end

  def create?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.owner?
        scope.where(id: user.owner&.id)
      else
        scope.all
      end
    end
  end
end