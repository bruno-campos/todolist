class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references  :user, null: false, index: true

      t.string  :name,      null: false
      t.text    :description

      t.integer :priority,  null: false, default: 0
      t.boolean :completed, null: false, default: false, index: true

      t.timestamps
    end
  end
end
