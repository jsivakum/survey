class AddResponseClass < ActiveRecord::Migration
  def change
    create_table(:responses) do |t|
      t.column(:response, :string)
      t.column(:question_id, :integer)

      t.timestamps
    end
    remove_column(:questions, :response)
    add_column(:questions, :chosen_response, :integer)
  end
end
