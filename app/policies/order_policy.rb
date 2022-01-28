class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user).order("updated_at DESC")
    end
  end
  def index?
    true
  end

  def new?
    true
  end
  def create?
    true
  end
end
