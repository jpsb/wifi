# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171129135930) do

  create_table "avaliacoes", force: :cascade do |t|
    t.string "internet"
    t.string "velocidade_internet"
    t.string "internet_aberta"
    t.string "senha_internet"
    t.text "comida"
    t.text "bebida"
    t.integer "atendimento"
    t.integer "preco"
    t.integer "nivel_qualidade"
    t.integer "nivel_ruido"
    t.integer "avaliacao_geral"
    t.integer "estabelecimento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estabelecimento_id"], name: "index_avaliacoes_on_estabelecimento_id"
  end

  create_table "estabelecimentos", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "cidade"
    t.string "estado"
    t.string "pais"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
