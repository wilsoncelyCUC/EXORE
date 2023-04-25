class CreateSocials < ActiveRecord::Migration[7.0]
  def change
    create_table :socials do |t|
      t.string :twitter_url
      t.string :github_url
      t.string :stack_overflow_url
      t.string :dribble_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
