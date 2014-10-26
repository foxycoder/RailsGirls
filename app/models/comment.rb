class Comment < ActiveRecord::Base
  include Shared::Publishable

  belongs_to :user
  belongs_to :post
end
