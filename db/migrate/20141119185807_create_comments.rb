class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :votes, :default => 0
      t.references :poem, index: true

      t.timestamps
    end
  end
end
