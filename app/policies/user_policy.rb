class UserPolicy < ApplicationPolicy

  def show?
    user.admin? || record == user
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
