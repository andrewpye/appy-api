class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
