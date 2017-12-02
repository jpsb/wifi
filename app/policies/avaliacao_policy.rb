class AvaliacaoPolicy < ApplicationPolicy
  def index?
    @user.admin? || @user.administrativo_portal?
  end

  def edit?
    return (@user && @record.usuario == @user)
  end

  def create?
    return @user
  end
end
