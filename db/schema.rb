# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 20_250_710_124_553) do
  create_table 'companies', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['name'], name: 'index_companies_on_name'
  end

  create_table 'tweets', force: :cascade do |t|
    t.integer 'user_id'
    t.text 'body'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['body'], name: 'index_tweets_on_body'
    t.index ['user_id'], name: 'index_tweets_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'display_name'
    t.string 'email'
    t.string 'username'
    t.integer 'company_id'
    t.datetime 'created_at', precision: nil, null: false
    t.datetime 'updated_at', precision: nil, null: false
    t.index ['company_id'], name: 'index_users_on_company_id'
    t.index %w[display_name username email], name: 'index_users_on_display_name_and_username_and_email'
  end

  add_foreign_key 'tweets', 'users'
  add_foreign_key 'users', 'companies'
end
