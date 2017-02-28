class AddImageToApp < ActiveRecord::Migration[5.0]
  def change
  	add_reference :apps, :image, :class_name => "ImageFile"
  	add_foreign_key :apps, :image_files, :name => "image"
  end
end
