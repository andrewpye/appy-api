class AddVersionToImageFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :image_files, :version, :integer
  end
end
