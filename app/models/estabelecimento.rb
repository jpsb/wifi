class Estabelecimento < ApplicationRecord
  extend Enumerize

  enumerize :tipo, in: [:cafe, :restaurante, :coworking, :livraria, :outro]

  has_many :avaliacoes

  validates :nome, presence: true,
                   length: { minimum: 3 },
                   uniqueness: { case_sensitive: false } 

  validates :endereco,
            :cidade, 
            :estado,
            :pais,
            :tipo,
            presence: true

end
