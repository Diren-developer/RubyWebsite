class CreateCoordinators < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinators do |t|
      t.string :name
      t.string :image
	  t.string :email
	  t.string :password

      t.timestamps
    end
  end
end
