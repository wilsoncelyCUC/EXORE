class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :phone
      t.string :github_id
      t.string :stack_overflow_id
      t.boolean :sign_up
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
