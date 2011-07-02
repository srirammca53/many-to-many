class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :client_name

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
