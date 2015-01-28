class Question < ActiveRecord::Base
  belongs_to :survey
  validates(:query, {:presence => true})
end
