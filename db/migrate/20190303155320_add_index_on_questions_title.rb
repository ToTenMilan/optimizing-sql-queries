class AddIndexOnQuestionsTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :questions, :title
  end
end
