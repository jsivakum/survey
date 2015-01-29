class EditQuestionsResponseCol < ActiveRecord::Migration
  def change
    rename_column :questions, :chosen_response, :response_id
  end
end
