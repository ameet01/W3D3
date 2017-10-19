class TagTopic < ApplicationRecord

  has_many :taggings,
  class_name: :Tagging,
  primary_key: :id,
  foreign_key: :tag_id

  has_many :urls,
  through: :taggings,
  source: :shortened_urls

  def popular_links
    urls.sort_by { |url| url.num_clicks }[0..4]
  end
end
