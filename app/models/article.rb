class Article < ActiveRecord::Base
  validates_presence_of :title
  validates :title, length: { minimum: 5 }
  validates_presence_of :text
  validates :text, length: { minimum: 140 }
end
