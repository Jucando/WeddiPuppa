class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def update?
  end
end
