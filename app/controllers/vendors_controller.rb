class VendorsController < ApplicationController
  # GET /vendors
  # GET /vendors.xml
 # GET /vendors/1/register?clientid=1
  # Register a client to a vendor
  def register

    @vendor = Vendor.find(params[:id])
# Access the associated clients
@client = vendor.clients

    @client = Client.find(params[:clientid])

    # Register a client if it is not registered already
    unless @vendor.registered?(@client)
      # Add vendor to a client's vendor list
      @client.vendors << @vendor
      flash[:notice] = 'Client register with the vendor successfully'
    else
      flash[:error] = 'Client already registered'
    end
    # Redirect to the action "clients"
    # Redirect to /vendors/1/clients for vendor id 1
    redirect_to :action => :clients, :id => @vendor
  end

  # Display all clients of a vendor
  # GET /vendors/1/clients
  def clients
    @clients = Vendor.find(params[:id]).clients
  end


  def index
    @vendors = Vendor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vendors }
    end
  end

  # GET /vendors/1
  # GET /vendors/1.xml
  def show
    @vendor = Vendor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vendor }
    end
  end

  # GET /vendors/new
  # GET /vendors/new.xml
  def new
    @vendor = Vendor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vendor }
    end
  end

  # GET /vendors/1/edit
  def edit
    @vendor = Vendor.find(params[:id])
  end

  # POST /vendors
  # POST /vendors.xml
  def create
    @vendor = Vendor.new(params[:vendor])

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to(@vendor, :notice => 'Vendor was successfully created.') }
        format.xml  { render :xml => @vendor, :status => :created, :location => @vendor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vendor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vendors/1
  # PUT /vendors/1.xml
  def update
    @vendor = Vendor.find(params[:id])

    respond_to do |format|
      if @vendor.update_attributes(params[:vendor])
        format.html { redirect_to(@vendor, :notice => 'Vendor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vendor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.xml
  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    respond_to do |format|
      format.html { redirect_to(vendors_url) }
      format.xml  { head :ok }
    end
  end
end
