class CreateTables < ActiveRecord::Migration
  def change
    create_table(:questions) do |t|
      t.column(:query, :string)
      t.column(:response, :string)
      t.column(:survey_id, :integer)
      t.timestamps
    end

    create_table(:surveys) do |t|
      t.column(:name, :string)
      t.timestamps
    end
  end
end
