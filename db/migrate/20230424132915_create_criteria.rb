class CreateCriteria < ActiveRecord::Migration[7.0]
  def change
    create_table :criteria do |t|
      t.string :search_status
      t.string :notice_period
      t.string :location
      t.string :salary_grid
      t.references :user, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
