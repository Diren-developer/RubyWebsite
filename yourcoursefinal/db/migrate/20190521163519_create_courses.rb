class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :prerequisite
	  t.text :description
	  t.string :image
      t.datetime :created, default: -> { 'CURRENT_TIMESTAMP' }
	  t.references :coordinator, foreign_key: true

      t.timestamps
    end
  end
end
