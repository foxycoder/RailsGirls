class Post < ActiveRecord::Base
  include Shared::Publishable

  extend FriendlyId
  friendly_id :title

  belongs_to :user
  has_many :comments

  accepts_nested_attributes_for :comments

  validates_presence_of :title, :content
end
