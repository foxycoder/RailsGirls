module Shared::Publishable
  extend ActiveSupport::Concern

  included do
    def self.published
      where("published_at < ?", DateTime.now)
    end

    def self.published_or_owned_by(user = nil)
      return published if user.blank?
      where("published_at < ? OR user_id = ?", DateTime.now, user.id)
    end

    def published?
      published_at.present? && published_at < DateTime.now
    end

    def unpublished?
      !published?
    end

    def publish
      update_attribute(:published_at, DateTime.now)
    end
  end
end
