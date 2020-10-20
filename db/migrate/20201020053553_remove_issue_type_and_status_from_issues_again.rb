class RemoveIssueTypeAndStatusFromIssuesAgain < ActiveRecord::Migration[5.2]
  def change
    remove_column :issues, :issue_type, :string
    remove_column :issues, :status, :string
  end
end
