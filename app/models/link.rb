class Link < ApplicationRecord
    validates :short_url, uniqueness: true
end
  