class Vtuber < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
end
