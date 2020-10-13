class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.string :summary
      t.text :detail
      t.string :type
      t.integer :priority
      t.integer :assigned_person
      t.string :status
      t.datetime :due_date

      t.timestamps
    end
  end
end
