class AddUsuarioToAvaliacoes < ActiveRecord::Migration[5.1]
  def change
    add_reference :avaliacoes, :usuario, foreign_key: true
  end
end
