class Reservation < ApplicationRecord
    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :num_o_p, presence: true, numericality: { only_integer: true }
    validates :user_id, presence: true
    validates :room_id, presence: true
    validates :only_date, presence: true

    belongs_to :user, optional:true
    belongs_to :room, optional:true

    def only_date
        unless self.checkin.nil? || self.checkout.nil?
            errors.add(:checkout,"の正しい日付を入力してください") if  self.checkin > self.checkout
        end
    end
end
