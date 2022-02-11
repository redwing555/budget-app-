class CreateGroupsOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_operations, :id => false do |t|
      t.references :group
      t.references :operation
    end

      add_index :groups_operations, [:group_id, :operation_id],
      name: "groups_operations_index",
      unique: true
  end
end
