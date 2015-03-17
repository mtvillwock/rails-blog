class Article < ActiveRecord::Base
  validates_presence_of :title, length: { minimum: 5 }

  validates_presence_of :text, length: { minimum: 140 }
end
