class Configration < ApplicationRecord
  has_one_attached :sitelogo #active_starage
  has_one_attached :home_icon #active_starage
end
