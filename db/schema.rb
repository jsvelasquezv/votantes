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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150629025413) do

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows"

  create_table "votantes", force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.integer  "cedula"
    t.string   "direccion"
    t.string   "barrio"
    t.string   "comuna"
    t.string   "puesto"
    t.string   "mesa"
    t.string   "celular"
    t.string   "fijo"
    t.string   "email"
    t.string   "estadoCivil"
    t.string   "hijos"
    t.string   "fechaNacimiento"
    t.string   "profesion"
    t.text     "hobby"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
