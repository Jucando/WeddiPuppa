class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
       #All users can see every perfomances
    end

  end

  def show?
    true #All users can see every perfomance details
  end

  def create?
    return true  # Anyone can create a performance
  end

  def update?
    record.user == user  # Only performance creator can update it
  end

  def destroy?
    record.user == user  # Only performance creator can destroy it
  end
end



