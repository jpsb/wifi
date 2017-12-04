class AvaliacoesController < ApplicationController
  skip_after_action :verify_authorized, only: [:index, :minhas, :show]
  skip_before_action :authenticate_usuario!, only: [:index]

  has_scope :do_estabelecimento
  has_scope :com_internet
  has_scope :com_nota_geral

  # GET /avaliacoes
  # GET /avaliaacoes.json
  def index
    @avaliacoes = apply_scopes(Avaliacao.all)
  end

  # GET /avaliacoes/minhas
  # GET /avaliaacoes/minhas.json
  def minhas
    @avaliacoes = apply_scopes(Avaliacao.do_usuario(current_usuario))
  end

  def show
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @avaliacao = @estabelecimento.avaliacoes.find(params[:id])
  end

  def create
    authorize Avaliacao
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @avaliacao = @estabelecimento.avaliacoes.create(avaliacao_params.merge(usuario: current_usuario))

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
 
  # GET /estabelecimentos/1/avaliacoes/1/edit
  def edit
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @avaliacao = @estabelecimento.avaliacoes.find(params[:id])
    authorize @avaliacao
  end

  # PATCH/PUT /estabelecimentos/1
  # PATCH/PUT /estabelecimentos/1.json
  def update
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @avaliacao = @estabelecimento.avaliacoes.find(params[:id])
    authorize @avaliacao, :edit?
    respond_to do |format|
      if @avaliacao.update(avaliacao_params)
        format.html { redirect_to @estabelecimento, notice: 'Avaliaçãoo was successfully updated.' }
        format.json { render :show, status: :ok, location: @estabelecimento }
      else
        format.html { render :edit }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @estabelecimento = Estabelecimento.find(params[:estabelecimento_id])
    @avaliacao = @estabelecimento.avaliacoes.find(params[:id])
    authorize @avaliacao, :edit?
    @avaliacao.destroy
    redirect_to estabelecimento_path(@estabelecimento)
  end

  private
    def avaliacao_params
      params.require(:avaliacao).permit(:internet, :velocidade_internet, :internet_aberta, :senha_internet, :comida, :bebida, :atendimento, :preco, :nivel_qualidade, :nivel_ruido, :avaliacao_geral)
    end
end
