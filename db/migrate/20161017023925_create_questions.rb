class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :question
      t.string :kind
      t.jsonb :data
      t.references :survey, index: true, foreign_key: true

      t.timestamps
    end
  end
end
