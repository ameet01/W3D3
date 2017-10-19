class Visit < ApplicationRecord
  validates :shortenedurl_id, :user_id, presence: true

  belongs_to :users,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id

  belongs_to :shortened_urls,
  class_name: :ShortenedUrl,
  primary_key: :id,
  foreign_key: :shortenedurl_id

  def self.record_visit!(user, shortened_url)
    visited = Visit.new(user_id: user.id, shortenedurl_id: shortened_url.id)
    visited.save!
  end

end
