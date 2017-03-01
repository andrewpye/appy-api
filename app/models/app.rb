class App < ApplicationRecord
	belongs_to :created_by, class_name: "User", foreign_key: "created_by_id"
	belongs_to :image, class_name: "ImageFile", foreign_key: "image_id", :dependent => :destroy
end
