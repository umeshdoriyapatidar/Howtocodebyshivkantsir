class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.references :user, foregin_key: true, index: true
      t.references :job, foregin_key: true, index: true

      t.timestamps null: false
    end
  end
end
