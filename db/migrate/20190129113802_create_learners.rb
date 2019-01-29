class CreateLearners < ActiveRecord::Migration[5.2]
  def change
    create_table :learners do |t|
      t.string :full_name
      t.string :email

      t.timestamps
    end
  end
end
