class DelteeCloumnResponseId < ActiveRecord::Migration
  def change
    remove_column(:questions, :response_id)
    add_column(:responses, :chosen, :boolean)
  end
end
