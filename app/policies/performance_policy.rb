class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all #All users can see every perfomances
    end

    def show?
      true #All users can see every perfomance details
    end
  end

  def create?
    return true  # Anyone can create a performance
  end

  def update?
  record.user == current_user  # Only performance creator can update it
  end

  def destroy?
  record.user == current_user  # Only performance creator can update it
  end
end



