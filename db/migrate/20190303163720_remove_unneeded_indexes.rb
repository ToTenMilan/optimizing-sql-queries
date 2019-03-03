class RemoveUnneededIndexes < ActiveRecord::Migration[5.2]
  def change
    remove_index :answers, name: "index_answers_on_possible_answer_id"
  end
end
