class Tagging < ApplicationRecord

  belongs_to :shortened_urls,
  class_name: :ShortenedUrl,
  primary_key: :id,
  foreign_key: :shortenedurl_id

  belongs_to :tag_topics,
  class_name: :TagTopic,
  primary_key: :id,
  foreign_key: :tag_id

  def self.record_tagging!(tag_topic, shortened_url)
    tag = Tagging.new(tag_id: tag_topic.id, shortenedurl_id: shortened_url.id)
    tag.save!
  end
end
