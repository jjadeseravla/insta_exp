class Post < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://img.wennermedia.com/social/rs-222960-elvis.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
