class Org < ApplicationRecord
  has_many :opps

  # acts_as_votable gem
  acts_as_votable
end

#milly