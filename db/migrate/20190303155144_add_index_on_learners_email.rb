class AddIndexOnLearnersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :learners, :email, unique: true
  end
end
