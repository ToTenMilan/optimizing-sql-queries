class AddIndexOnPossibleAnswersValue < ActiveRecord::Migration[5.2]
  def change
    add_index :possible_answers, :value, where: "value = 'Possible Answer Incorrect'"
  end
end
