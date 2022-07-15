class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.references :user, foregin_key: true, index: true
      t.string :title, null: false
      t.text :description, null: false
      t.string :salary, null: false
      t.string :skillsets, null: false

      t.timestamps null: false
    end
  end
end
