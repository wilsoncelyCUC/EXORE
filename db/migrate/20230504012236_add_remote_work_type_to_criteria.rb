class AddRemoteWorkTypeToCriteria < ActiveRecord::Migration[7.0]
  def change
    add_column :criteria, :remote_work_type, :string
  end
end
