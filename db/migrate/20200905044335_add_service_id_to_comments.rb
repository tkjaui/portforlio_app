class AddServiceIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :service_id, :string
  end
end
