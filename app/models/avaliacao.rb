class Avaliacao < ApplicationRecord
  extend Enumerize

  enumerize :internet, in: [:nao, :sim]
  enumerize :internet_aberta, in: [:nao, :sim]

  belongs_to :estabelecimento

  validates :internet, 
            :comida,
            :bebida,
            :atendimento,
            :preco,
            :nivel_qualidade,
            :nivel_ruido,
            :avaliacao_geral,
            presence: true

  validates :velocidade_internet,
            :internet_aberta, 
            presence: true,
            if: "internet && internet.sim?"

  validates :senha_internet,
            presence: true,
            if: "internet_aberta && internet_aberta.nao?"

end
