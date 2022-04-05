class CreateLabReports < ActiveRecord::Migration[6.1]
  def change
    create_table :lab_reports do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.string :description
      t.string :grade

      t.timestamps
    end
  end
end
