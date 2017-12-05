class EstabelecimentoPolicy < ApplicationPolicy
  def pode_avaliar?
    (@user && !@user.avaliacoes.do_estabelecimento(@record).any?)
  end

  def edit?
    return @user
  end

end
