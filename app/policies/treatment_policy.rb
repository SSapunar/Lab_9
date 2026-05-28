class TreatmentPolicy < ApplicationPolicy
  def create?
    user.admin? || (user.vet? && user.vet.present? && record.appointment&.vet == user.vet)
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def update?
    user.admin? || (user.vet? && user.vet.present? && record.appointment&.vet == user.vet)
  end

  def destroy?
    user.admin? || (user.vet? && user.vet.present? && record.appointment&.vet == user.vet)
  end
end