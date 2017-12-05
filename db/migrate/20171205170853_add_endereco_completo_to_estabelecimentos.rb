class AddEnderecoCompletoToEstabelecimentos < ActiveRecord::Migration[5.1]
  def change
    add_column :estabelecimentos, :endereco_completo, :string
  end
end
