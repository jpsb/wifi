class Estabelecimento < ApplicationRecord

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
