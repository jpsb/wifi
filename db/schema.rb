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

ActiveRecord::Schema.define(version: 20171205170853) do

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
    t.integer "usuario_id"
    t.index ["estabelecimento_id"], name: "index_avaliacoes_on_estabelecimento_id"
    t.index ["usuario_id"], name: "index_avaliacoes_on_usuario_id"
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
    t.string "endereco_completo"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

end
