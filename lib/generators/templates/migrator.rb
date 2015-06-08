class FavorableMigration < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.references :favorable, polymorphic: true
      t.references :favoriter, polymorphic: true
      
      t.timestamps
    end

    add_index :favorites, [:favorable_id, :favorable_type]
    add_index :favorites, [:favoriter_id, :favoriter_type]
  end


  def self.down
    drop_table :favorites
  end
end