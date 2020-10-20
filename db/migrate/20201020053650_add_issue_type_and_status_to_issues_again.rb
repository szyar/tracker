class AddIssueTypeAndStatusToIssuesAgain < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :issue_type, :integer
    add_column :issues, :status, :integer
  end
end
