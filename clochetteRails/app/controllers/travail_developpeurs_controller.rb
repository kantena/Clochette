class TravailDeveloppeursController < ApplicationController
  # GET /travail_developpeurs
  # GET /travail_developpeurs.xml
  def index
    @travail_developpeurs = TravailDeveloppeur.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @travail_developpeurs }
    end
  end

  # GET /travail_developpeurs/1
  # GET /travail_developpeurs/1.xml
  def show
    @travail_developpeur = TravailDeveloppeur.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @travail_developpeur }
    end
  end

  # GET /travail_developpeurs/new
  # GET /travail_developpeurs/new.xml
  def new
    @travail_developpeur = TravailDeveloppeur.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @travail_developpeur }
    end
  end

  # GET /travail_developpeurs/1/edit
  def edit
    @travail_developpeur = TravailDeveloppeur.find(params[:id])
  end

  # POST /travail_developpeurs
  # POST /travail_developpeurs.xml
  def create
    @travail_developpeur = TravailDeveloppeur.new(params[:travail_developpeur])

    respond_to do |format|
      if @travail_developpeur.save
        format.html { redirect_to(@travail_developpeur, :notice => 'TravailDeveloppeur was successfully created.') }
        format.xml  { render :xml => @travail_developpeur, :status => :created, :location => @travail_developpeur }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @travail_developpeur.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /travail_developpeurs/1
  # PUT /travail_developpeurs/1.xml
  def update
    @travail_developpeur = TravailDeveloppeur.find(params[:id])

    respond_to do |format|
      if @travail_developpeur.update_attributes(params[:travail_developpeur])
        format.html { redirect_to(@travail_developpeur, :notice => 'TravailDeveloppeur was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @travail_developpeur.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /travail_developpeurs/1
  # DELETE /travail_developpeurs/1.xml
  def destroy
    @travail_developpeur = TravailDeveloppeur.find(params[:id])
    @travail_developpeur.destroy

    respond_to do |format|
      format.html { redirect_to(travail_developpeurs_url) }
      format.xml  { head :ok }
    end
  end
end
