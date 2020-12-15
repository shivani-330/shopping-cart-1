class RenameColumnInAddresses < ActiveRecord::Migration[6.0]
  def up
    rename_column :addresses, :Address1, :address1
    rename_column :addresses, :Address2, :address2
  end

  def down
    rename_column :addresses, :address1, :Address1
    rename_column :addresses, :address2, :Address2
  end
end
