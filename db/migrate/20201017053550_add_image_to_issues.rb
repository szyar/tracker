class AddImageToIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :image, :string
  end
end
