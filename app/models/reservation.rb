class Reservation < ApplicationRecord
    validates :start_date, {presence: true}
    validates :end_date, {presence: true}
    validates :people, {presence: true}
    validates :user_id, {presence: true}
    validates :post_id, {presence: true}
end
