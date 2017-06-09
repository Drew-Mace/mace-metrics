class AddEventIdToRegisteredApplications < ActiveRecord::Migration
  def change
    add_column :registered_applications, :event_id, :integer
  end
end
