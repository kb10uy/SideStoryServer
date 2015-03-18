class Post < ActiveRecord::Base
  acts_as_taggable
  default_scope ->{ order(:id) }
  validates :title, length: { in: 1..96 }
  validates :content, length: { minimum: 1 }
  belongs_to :user
end
