class PetPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.admin? || user.vet? || user.owner? && record.owner == user.owner
  end

  def create?
    user.admin? || user.owner?
  end

  def edit?
    update?
  end

  def update?
    user.admin? || user.owner? && record.owner == user.owner
  end

  def destroy?
    user.admin? || user.owner? && record.owner == user.owner
  end

  def permitted_attributes
    if user.admin?
      [:name, :species, :breed, :date_of_birth, :weight, :owner_id, :photo]
    else
      [:name, :species, :breed, :date_of_birth, :weight, :photo]
    end
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin? || user.vet?
        scope.all
      elsif user.owner?
        scope.where(owner: user.owner)
      else
        scope.none
      end
    end
  end
end