class Service < ApplicationRecord
  attachment :image
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :company
    validates :device
    validates :problem
    validates :price
    validates :days
    validates :result
    validates :body
    validates :image
  end

end
