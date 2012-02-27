# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120226205919) do

  create_table "artistas", :force => true do |t|
    t.string   "nombre"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "datos_importados", :force => true do |t|
    t.string   "artista"
    t.date     "fecha"
    t.time     "horario"
    t.string   "lugar"
    t.string   "direccion1"
    t.string   "barrio1"
    t.string   "web1"
    t.string   "mail1"
    t.string   "telefono1"
    t.string   "source"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "importado"
  end

  create_table "eventos", :force => true do |t|
    t.integer  "artista_id"
    t.integer  "lugar_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "fecha"
  end

  add_index "eventos", ["artista_id"], :name => "index_eventos_on_artista_id"
  add_index "eventos", ["lugar_id"], :name => "index_eventos_on_lugar_id"

  create_table "lugares", :force => true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "apellido"
    t.string   "nombre"
    t.string   "login"
    t.string   "email"
    t.string   "clave_encriptada"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
