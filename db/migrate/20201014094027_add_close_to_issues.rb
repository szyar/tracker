class AddCloseToIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :close_issue, :boolean, default: false
  end
end
