class AddIndexOnLearnersFullName < ActiveRecord::Migration[5.2]
  def change
    add_index :learners, :full_name
  end
end
