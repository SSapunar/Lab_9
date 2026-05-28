class OwnerPolicy < ApplicationPolicy
  def index?
    user.admin? || user.owner?
  end

  def show?
    user.admin? || (user.owner? && record == user.owner)
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def update?
    user.admin? || (user.owner? && record == user.owner)
  end

  def destroy?
    user.admin?
  end

  def permitted_attributes
    [:first_name, :last_name, :email, :phone, :address]
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.owner?
        scope.where(id: user.owner&.id)
      else
        scope.none
      end
    end
  end
end