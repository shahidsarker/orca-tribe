class Opp < ApplicationRecord
    belongs_to :org
    #changed from orgs to org
    has_many :users #volunteers
end

#milly
