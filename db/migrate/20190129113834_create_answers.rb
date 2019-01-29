class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.belongs_to :learner, foreign_key: true
      t.belongs_to :possible_answer, foreign_key: true

      t.timestamps
    end
  end
end
