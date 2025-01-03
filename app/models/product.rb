class Product < ApplicationRecord
    include Notifications

  has_many :subscribers, dependent: :destroy
  has_one_attached :featured_image
  has_rich_text :description
  belongs_to :brand   # Mối quan hệ với Brand

  validates :name, presence: true
  validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :brand, presence: true

  # tự động sinh short_description từ description
  before_save :generate_short_description

  private

  def generate_short_description
    if description.body.to_plain_text.present?
      # lấy 300 ký tự đầu tiên từ description làm short_description
      self.short_description = description.body.to_plain_text[0, 300]
    end
  end
end
  