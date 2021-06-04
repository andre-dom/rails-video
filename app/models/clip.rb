class Clip < ApplicationRecord
  belongs_to :user
  mount_uploader :video, VideoUploader

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :video, presence: true

  validates_length_of :title, minimum: 1, maximum: 15
end
