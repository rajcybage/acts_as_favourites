ActiveRecord::Schema.define  do

  drop_table :favorites if ActiveRecord::Base.connection.table_exists? 'favorites'
  drop_table :users if ActiveRecord::Base.connection.table_exists? 'users'
  drop_table :posts if ActiveRecord::Base.connection.table_exists? 'posts'

  create_table :favorites do |t|
    t.references :favorable, polymorphic: true
    t.references :favoriter, polymorphic: true

    t.timestamps
  end

  add_index :favorites, [:favorable_id, :favorable_type]
  add_index :favorites, [:favoriter_id, :favoriter_type]


  create_table :users do |t|
    t.string :name
  end

  create_table :posts do |t|
    t.string :name
  end
end