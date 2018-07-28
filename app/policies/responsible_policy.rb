class ResponsiblePolicy < ApplicationPolicy
  def index?
    user.responsible?
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
