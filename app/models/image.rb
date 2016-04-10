class Image < ActiveRecord::Base
  mount_uploader :url, ImageUploader

  scope :of_place,  ->place_id{where(owner_id: place_id,
    owner_type: Settings.owner_types.place)}
  scope :of_many_places, ->place_ids{where(owner_id: place_ids,
    owner_type: Settings.owner_types.place)}
end
