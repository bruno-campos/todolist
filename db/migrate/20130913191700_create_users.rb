class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :login,           null: false, index: true
      t.string  :name
      t.string  :password_digest, null: false

      t.string  :api_key,         null: false

      t.timestamps
    end
  end
end
