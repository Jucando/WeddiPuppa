class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all #All users can see every perfomances
    end

    def show?
      true #All users can see every perfomance details
    end
  end
end
