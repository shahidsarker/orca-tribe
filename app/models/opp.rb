class Opp < ApplicationRecord
    belongs_to :org
    #changed from orgs to org
    has_many :user_opps
    has_many :users, through: :user_opps #volunteers
end

#milly
