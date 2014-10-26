class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title

  belongs_to :user
  has_many :comments

  accepts_nested_attributes_for :comments

  validates_presence_of :title, :content

  def self.published
    where("published_at < ?", DateTime.now)
  end

  def self.published_and_owned_by(user = nil)
    return published if user.blank?
    where("published_at < ? OR user_id = ?", DateTime.now, user.id)
  end

  def published?
    published_at && published_at < DateTime.now
  end

  def unpublished?
    !published?
  end

  def publish
    update_attribute(:published_at, DateTime.now)
  end
end
