class Clip < ApplicationRecord
  belongs_to :user
  mount_uploader :video, VideoUploader

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :video, presence: true
end
