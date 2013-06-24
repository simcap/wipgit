class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :uri
      t.references :user

      t.timestamps
    end
    add_index :repos, :user_id
  end
end
