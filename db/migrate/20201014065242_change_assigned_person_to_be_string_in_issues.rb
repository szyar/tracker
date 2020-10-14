class ChangeAssignedPersonToBeStringInIssues < ActiveRecord::Migration[5.2]
  def change
    change_column :issues, :assigned_person, :string
  end
end
