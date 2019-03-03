class AddIndexOnPossibleAnswerAndLearner < ActiveRecord::Migration[5.2]
  def change
    add_index :answers, [:possible_answer_id, :learner_id]
  end
end
