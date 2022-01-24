class Order < ApplicationRecord
  belongs_to :product_id
  belongs_to :user_id
end
