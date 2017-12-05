class AvaliacoesController < ApplicationController
  skip_after_action :verify_authorized, only: [:index, :minhas, :show]
  skip_before_action :authenticate_usuario!, only: [:index, :show]

  has_scope :do_estabelecimento
  has_scope :com_internet
  has_scope :com_nota_geral
  has_scope :do_tipo
  has_scope :com_localizacao
  has_scope :com_preco

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
    @avaliacao = Avaliacao.find(params[:id])
  end

  # GET /avaliacoes/new
  def new
    authorize Avaliacao, :create?
    @avaliacao = Avaliacao.new
    @avaliacao.estabelecimento_id = params[:estabelecimento_id]
  end

  def create
    authorize Avaliacao
    @avaliacao = Avaliacao.create(avaliacao_params.merge(usuario: current_usuario))

    respond_to do |format|
      if @avaliacao.errors.any?
        format.html { render :new }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to avaliacoes_path, notice: 'Avaliação efetuada com sucesso.' }
        format.json { render :show, status: :created, location: @avaliacao }
      end
    end
  end
 
  # GET /estabelecimentos/1/avaliacoes/1/edit
  def edit
    @avaliacao = Avaliacao.find(params[:id])
    authorize @avaliacao
  end

  # PATCH/PUT /avaliacoes/1
  # PATCH/PUT /avaliacoes/1.json
  def update
    @avaliacao = Avaliacao.find(params[:id])
    authorize @avaliacao, :edit?
    respond_to do |format|
      if @avaliacao.update(avaliacao_params)
        format.html { redirect_to avaliacoes_path, notice: 'Avaliação atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @avaliacao }
      else
        format.html { render :edit }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @avaliacao = Avaliacao.find(params[:id])
    authorize @avaliacao, :edit?
    @avaliacao.destroy
    redirect_to avaliacoes_path, notice: 'Avaliação excluída com sucesso.'
  end

  private
    def avaliacao_params
      params.require(:avaliacao).permit(:estabelecimento_id, :internet, :velocidade_internet, :internet_aberta, :senha_internet, :comida, :bebida, :atendimento, :preco, :nivel_qualidade, :nivel_ruido, :avaliacao_geral)
    end
end
