class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    return true  # Anyone can create a performance
  end

  def update?
  record.user == user  # Only performance creator can update it
  end

  def destroy?
  record.user == user  # Only performance creator can update it
  end
end



