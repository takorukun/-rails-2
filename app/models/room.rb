class Room < ApplicationRecord
    validates :room_name, presence: true
    validates :room_intro, presence: true
    validates :fee_p_d, presence: true, numericality: { only_integer: true }
    validates :address, presence: true
    validates :user_id, presence: true
    mount_uploader :room_image, ImageUploader

    belongs_to :user, optional:true
end
