class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :genre
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: true
  has_one_attached :image #active_starage
  has_many :recommend_articles

  is_impressionable :counter_cache => true, :column_name => :pv_count, unique: :all

  validates :title, presence: true

  scope :tags_search, ->(tags, titles) {
    if tags.present? || titles.present?
      where(id: tags).or(where(id: titles))
    end
  }

  extend OrderAsSpecified #gem extend OrderAsSpecified で並び替えする為の記述
end
