class AddIndexOnPossibleAnswerCorrect < ActiveRecord::Migration[5.2]
  def change
    add_index :possible_answers, :correct, where: 'correct = FALSE'
  end
end
