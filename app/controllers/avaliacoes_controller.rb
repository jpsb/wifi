class AvaliacoesController < ApplicationController
  def create
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @avaliacao = @estabelecimento.avaliacoes.create(avaliacao_params)

    respond_to do |format|
      if @avaliacao.errors.any?
        format.html { render("estabelecimentos/show") }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to @estabelecimento, notice: 'Avaliação efetuada com sucesso.' }
        format.json { render :show, status: :created, location: @estabelecimento }
      end
    end
  end
 
  private
    def avaliacao_params
      params.require(:avaliacao).permit(:internet, :velocidade_internet, :internet_aberta, :senha_internet, :comida, :bebida, :atendimento, :preco, :nivel_qualidade, :nivel_ruido, :avaliacao_geral)
    end
end
