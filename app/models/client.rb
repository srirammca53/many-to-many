class Client < ActiveRecord::Base
  has_and_belongs_to_many :vendors, :join_table => "vendors_link_clients"


end
