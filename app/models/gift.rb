class Gift < ApplicationRecord
  scope :mugs, -> { where(type: 'Mug') }
  scope :t_shirts, -> { where(type: 'TShirt') }
  scope :hoodies, -> { where(type: 'Hoodie') }
  scope :stickers, -> { where(type: 'Sticker') }
end
