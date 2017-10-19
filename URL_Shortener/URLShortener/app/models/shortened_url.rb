class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, uniqueness: true, presence: true
  validates :user_id, presence: true

  belongs_to :submitter,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id


  has_many :url_visitors,
  class_name: :Visit,
  primary_key: :id,
  foreign_key: :shortenedurl_id

  has_many :visitors,
  through: :url_visitors,
  source: :users



  has_many :taggings,
  class_name: :Tagging,
  primary_key: :id,
  foreign_key: :shortenedurl_id


  has_many :tags,
  through: :taggings,
  source: :tag_topics

  def self.random_code
    code = SecureRandom.urlsafe_base64(16)
    until !ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.urlsafe_base64(16)
    end
    code
  end

  def self.create_shorturl(user, long)
    short = ShortenedUrl.random_code
    shortened = ShortenedUrl.new(user_id: user.id, short_url: short, long_url: long)
    shortened.save!
    shortened
  end

  def num_clicks
    self.url_visitors.count
  end

  def num_uniques
    self.url_visitors.select(:user_id).distinct.count
  end

  def num_recent_uniques
    self.url_visitors.select(:user_id).distinct.where("created_at > ?", 180.minutes.ago).count
  end

end
