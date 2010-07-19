class FacturationsController < ApplicationController
  # GET /facturations
  # GET /facturations.xml
  def index
    @facturations = Facturation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @facturations }
    end
  end

  # GET /facturations/1
  # GET /facturations/1.xml
  def show
    @facturation = Facturation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @facturation }
    end
  end

  # GET /facturations/new
  # GET /facturations/new.xml
  def new
    @facturation = Facturation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @facturation }
    end
  end

  # GET /facturations/1/edit
  def edit
    @facturation = Facturation.find(params[:id])
  end

  # POST /facturations
  # POST /facturations.xml
  def create
    @facturation = Facturation.new(params[:facturation])

    respond_to do |format|
      if @facturation.save
        format.html { redirect_to(@facturation, :notice => 'Facturation was successfully created.') }
        format.xml  { render :xml => @facturation, :status => :created, :location => @facturation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @facturation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /facturations/1
  # PUT /facturations/1.xml
  def update
    @facturation = Facturation.find(params[:id])

    respond_to do |format|
      if @facturation.update_attributes(params[:facturation])
        format.html { redirect_to(@facturation, :notice => 'Facturation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @facturation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /facturations/1
  # DELETE /facturations/1.xml
  def destroy
    @facturation = Facturation.find(params[:id])
    @facturation.destroy

    respond_to do |format|
      format.html { redirect_to(facturations_url) }
      format.xml  { head :ok }
    end
  end
end
