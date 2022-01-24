class Product < ApplicationRecord
  belongs_to :user_id
  belongs_to :order
end
