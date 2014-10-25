class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title

  validates_presence_of :title, :content

  belongs_to :user
end
