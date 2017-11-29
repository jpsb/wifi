class CreateEstabelecimentos < ActiveRecord::Migration[5.1]
  def change
    create_table :estabelecimentos do |t|
      t.string :nome
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :pais
      t.string :tipo
      t.timestamps
    end
  end
end
