class Room < ApplicationRecord
    validates :room_name, presence: true
    validates :room_intro, presence: true
    validates :fee_p_d, presence: true, numericality: { only_integer: true }, format: { with: /\A[0-9\d]+\z/ }
    validates :address, presence: true
    validates :user_id, presence: true
    mount_uploader :room_image, ImageUploader

    has_many :reservations, dependent: :destroy
    belongs_to :users, optional:true

    def self.ransackable_attributes(auth_object = nil)
        ["address", "created_at", "fee_p_d", "id", "room_image", "room_intro", "room_name", "updated_at", "user_id"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["user"]
    end

end
