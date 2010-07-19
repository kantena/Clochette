# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100718195044) do

  create_table "clients", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.text     "infos_projets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "client_ce_mois"
  end

  create_table "facturations", :force => true do |t|
    t.text     "liste_dev_attente_validation"
    t.date     "date_archivage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "etat_valide"
    t.boolean  "facturation_envoyee"
    t.string   "client"
    t.date     "date_creation"
    t.integer  "nb_jours_a_facturer"
  end

  create_table "travail_developpeurs", :force => true do |t|
    t.string   "client"
    t.string   "nom_developpeur"
    t.integer  "nb_jours_travail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "validation_nb_jours_travail"
    t.string   "mois"
    t.integer  "annee"
  end

  create_table "utilisateurs", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
