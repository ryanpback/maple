class Url < ApplicationRecord
  validates_presence_of :long_url
  validates_uniqueness_of :slug
end
