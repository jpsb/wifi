class Avaliacao < ApplicationRecord
  extend Enumerize

  enumerize :internet, in: [:nao, :sim]
  enumerize :internet_aberta, in: [:nao, :sim]

  belongs_to :estabelecimento
  belongs_to :usuario

  validates :internet, 
            :comida,
            :bebida,
            :atendimento,
            :preco,
            :nivel_qualidade,
            :nivel_ruido,
            :avaliacao_geral,
            presence: true

  validates :internet_aberta, 
            presence: true,
            if: "internet && internet.sim?"

  validates :velocidade_internet, 
            presence: true,
            numericality: { only_integer: true, greater_than: 0 },
            if: "internet && internet.sim?"

  validates :senha_internet,
            presence: true,
            if: "internet_aberta && internet_aberta.nao?"

  validates :estabelecimento_id, uniqueness: { scope: :usuario }

  scope :do_usuario, -> (usuario) { where(usuario: usuario) }
  scope :com_internet, -> (internets) { where(internet: internets) }
  scope :com_nota_geral, -> (nota) { where(avaliacao_geral: nota) }
  scope :do_estabelecimento, -> (estabelecimento) { where(estabelecimento_id: estabelecimento) }

  scope :do_tipo, -> (tipo) { joins(:estabelecimento).where("estabelecimentos.tipo = ? ", tipo) }
  scope :com_localizacao, -> (localizacao) { joins(:estabelecimento).where("estabelecimentos.endereco_completo like ? ", "%#{localizacao}%") }
  scope :com_preco, -> (preco) { where(preco: preco) }


end
