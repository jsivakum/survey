class AddDescriptionToSurvey < ActiveRecord::Migration
  def change
    add_column(:survey, :description, :string)
  end
end
