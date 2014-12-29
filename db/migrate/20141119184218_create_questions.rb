class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :votes, :default => 0

      t.timestamps
    end
  end
end
