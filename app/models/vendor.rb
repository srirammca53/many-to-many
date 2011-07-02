class Vendor < ActiveRecord::Base
# define many-to-many relation
   has_and_belongs_to_many :clients, :join_table => "vendors_link_clients"
def registered?(client)
    self.clients.include?(client)
 end
  def
    clients = self.clients
    clients.each do |client|
       client.client_name
    end
  end

end
