class Notification < ApplicationRecord
  belongs_to :product_stock

  scope :unread, -> { where(read: false) }

  def mark_as_read!
    update(read: true)
  end
end
