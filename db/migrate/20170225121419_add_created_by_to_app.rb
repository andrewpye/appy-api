class AddCreatedByToApp < ActiveRecord::Migration[5.0]
  def change
  	add_reference :apps, :created_by, :class_name => "User"
  	add_foreign_key :apps, :users, :name => "created_by"
  end
end
