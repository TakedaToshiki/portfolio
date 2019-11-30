class Post < ApplicationRecord
    mount_uploaders :images, ImageUploader
    serialize :images, JSON
    mount_uploaders :videos, VideoUploader
    serialize :videos, JSON    
    
    validates :content, length: { maximum: 200 }
    validates :content, presence: true
    validates :title, presence: true
end
