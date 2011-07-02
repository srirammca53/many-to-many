class CreateClientsVendors < ActiveRecord::Migration
  def self.up
# Create the association table
    create_table :clients_vendors, :id => false do |t|
      t.integer :client_id, :null => false
      t.integer :vendor_id, :null => false
    end
  # Add table index
    add_index :clients_vendors, [:client_id, :vendor_id], :unique => true

  end

  def self.down
remove_index :clients_vendors, :column => [:client_id, :vendor_id]
    drop_table :clients_vendors

  end
end
