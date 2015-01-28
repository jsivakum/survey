class Survey < ActiveRecord::Base
  has_many :questions
  validates(:description, {:presence => true, :length => {:maximum => 50}})
  validates(:name, {:presence => true, :length => {:maximum => 50}})
  before_save(:title_case_name)


private

    define_method(:title_case_name) do
      self.name=(name().titleize())
    end

end
