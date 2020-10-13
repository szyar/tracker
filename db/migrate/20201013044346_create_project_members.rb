class CreateProjectMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_members do |t|
      t.string :role
      t.references :user, foreign_key: true, index: true, null: false
      t.references :project, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
