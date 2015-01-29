class Question < ActiveRecord::Base
  belongs_to :survey
  has_and_belongs_to_many :responses
  validates(:query, {:presence => true})
end
