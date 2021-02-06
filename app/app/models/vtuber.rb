class Vtuber < ApplicationRecord
    validates :name, presence: true
    validates :subscribers, presence: true
    validates :superchats, presence: true

    mount_uploader :avatar, AvatarUploader

    has_many :videos
end
