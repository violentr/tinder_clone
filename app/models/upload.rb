class Upload < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
    :url => "/uploads/:id/:style/:basename.:extension",
                          :path => "/uploads/:id/:style/:basename.:extension"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
