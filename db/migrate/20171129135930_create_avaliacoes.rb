class CreateAvaliacoes < ActiveRecord::Migration[5.1]
  def change
    create_table :avaliacoes do |t|
      t.string :internet
      t.string :velocidade_internet
      t.string :internet_aberta
      t.string :senha_internet
      t.text :comida
      t.text :bebida
      t.integer :atendimento
      t.integer :preco
      t.integer :nivel_qualidade
      t.integer :nivel_ruido
      t.integer :avaliacao_geral
      t.references :estabelecimento, foreign_key: true
      t.timestamps
    end
  end
end
