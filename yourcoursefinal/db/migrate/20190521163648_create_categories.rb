class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
	
	add_index :categories, :name, unique: true
	
	create_join_table :categories, :courses
  end
end
