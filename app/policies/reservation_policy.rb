class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    record.performance.user != user
  end

  def update?
    record.user == user
  end

  def edit_pending?
    update_pending?
  end

  def update_pending?
    record.performance.user == user
  end
end
