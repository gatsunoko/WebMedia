class Genre < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :genre_recommend_tags, dependent: :destroy
  accepts_nested_attributes_for :genre_recommend_tags, allow_destroy: true
  has_one_attached :image #active_starage
  has_one_attached :icon #active_starage
end
