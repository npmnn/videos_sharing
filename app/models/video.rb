class Video < ApplicationRecord
  belongs_to :user

  validates :link, presence: true, format: { with: /\A(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?v=([^\s&]+)\z/i,
                                             message: "Must be a valid YouTube link" }
end
