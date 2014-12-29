class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.text :content
      t.integer :votes, :default => 0

      t.timestamps
    end
  end
end
