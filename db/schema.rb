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

ActiveRecord::Schema.define(version: 20131030121132) do

  create_table "bets", force: true do |t|
    t.integer  "user_id"
    t.integer  "time",                            null: false
    t.integer  "quote_start",                     null: false
    t.integer  "quote_final",                     null: false
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "USD", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tool_id"
    t.integer  "status"
  end

  add_index "bets", ["user_id"], name: "index_bets_on_user_id"

  create_table "cms_blocks", force: true do |t|
    t.integer  "page_id",                     null: false
    t.string   "identifier",                  null: false
    t.text     "content",    limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cms_blocks", ["page_id", "identifier"], name: "index_cms_blocks_on_page_id_and_identifier"

  create_table "cms_categories", force: true do |t|
    t.integer "site_id",          null: false
    t.string  "label",            null: false
    t.string  "categorized_type", null: false
  end

  add_index "cms_categories", ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_categorized_type_and_label", unique: true

  create_table "cms_categorizations", force: true do |t|
    t.integer "category_id",      null: false
    t.string  "categorized_type", null: false
    t.integer "categorized_id",   null: false
  end

  add_index "cms_categorizations", ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true

  create_table "cms_files", force: true do |t|
    t.integer  "site_id",                                    null: false
    t.integer  "block_id"
    t.string   "label",                                      null: false
    t.string   "file_file_name",                             null: false
    t.string   "file_content_type",                          null: false
    t.integer  "file_file_size",                             null: false
    t.string   "description",       limit: 2048
    t.integer  "position",                       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cms_files", ["site_id", "block_id"], name: "index_cms_files_on_site_id_and_block_id"
  add_index "cms_files", ["site_id", "file_file_name"], name: "index_cms_files_on_site_id_and_file_file_name"
  add_index "cms_files", ["site_id", "label"], name: "index_cms_files_on_site_id_and_label"
  add_index "cms_files", ["site_id", "position"], name: "index_cms_files_on_site_id_and_position"

  create_table "cms_layouts", force: true do |t|
    t.integer  "site_id",                                     null: false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                                       null: false
    t.string   "identifier",                                  null: false
    t.text     "content",    limit: 16777215
    t.text     "css",        limit: 16777215
    t.text     "js",         limit: 16777215
    t.integer  "position",                    default: 0,     null: false
    t.boolean  "is_shared",                   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cms_layouts", ["parent_id", "position"], name: "index_cms_layouts_on_parent_id_and_position"
  add_index "cms_layouts", ["site_id", "identifier"], name: "index_cms_layouts_on_site_id_and_identifier", unique: true

  create_table "cms_pages", force: true do |t|
    t.integer  "site_id",                                         null: false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                                           null: false
    t.string   "slug"
    t.string   "full_path",                                       null: false
    t.text     "content",        limit: 16777215
    t.integer  "position",                        default: 0,     null: false
    t.integer  "children_count",                  default: 0,     null: false
    t.boolean  "is_published",                    default: true,  null: false
    t.boolean  "is_shared",                       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cms_pages", ["parent_id", "position"], name: "index_cms_pages_on_parent_id_and_position"
  add_index "cms_pages", ["site_id", "full_path"], name: "index_cms_pages_on_site_id_and_full_path"

  create_table "cms_revisions", force: true do |t|
    t.string   "record_type",                  null: false
    t.integer  "record_id",                    null: false
    t.text     "data",        limit: 16777215
    t.datetime "created_at"
  end

  add_index "cms_revisions", ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at"

  create_table "cms_sites", force: true do |t|
    t.string  "label",                       null: false
    t.string  "identifier",                  null: false
    t.string  "hostname",                    null: false
    t.string  "path"
    t.string  "locale",      default: "en",  null: false
    t.boolean "is_mirrored", default: false, null: false
  end

  add_index "cms_sites", ["hostname"], name: "index_cms_sites_on_hostname"
  add_index "cms_sites", ["is_mirrored"], name: "index_cms_sites_on_is_mirrored"

  create_table "cms_snippets", force: true do |t|
    t.integer  "site_id",                                     null: false
    t.string   "label",                                       null: false
    t.string   "identifier",                                  null: false
    t.text     "content",    limit: 16777215
    t.integer  "position",                    default: 0,     null: false
    t.boolean  "is_shared",                   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cms_snippets", ["site_id", "identifier"], name: "index_cms_snippets_on_site_id_and_identifier", unique: true
  add_index "cms_snippets", ["site_id", "position"], name: "index_cms_snippets_on_site_id_and_position"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "tools", force: true do |t|
    t.string   "name",         null: false
    t.string   "avatar"
    t.integer  "traderoom_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "symbol"
  end

  create_table "traderooms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "money_total_cents",      default: 0,     null: false
    t.string   "money_total_currency",   default: "USD", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
