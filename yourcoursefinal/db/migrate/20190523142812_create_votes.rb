class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :course, foreign_key: true
      t.references :coordinator, foreign_key: true
      t.boolean :result

      t.timestamps
    end
  end
end
