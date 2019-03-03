class AddIndexOnQuizName < ActiveRecord::Migration[5.2]
  def change
    add_index :quizzes, :name
  end
end
