class AddIssueTypeAndStatusToIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :issue_type, :string
    add_column :issues, :status, :string
  end
end
