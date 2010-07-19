class UtilisateursController < ApplicationController
  # GET /utilisateurs
  # GET /utilisateurs.xml
  def index
    @utilisateurs = Utilisateur.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @utilisateurs }
    end
  end

  # GET /utilisateurs/1
  # GET /utilisateurs/1.xml
  def show
    @utilisateur = Utilisateur.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @utilisateur }
    end
  end

  # GET /utilisateurs/new
  # GET /utilisateurs/new.xml
  def new
    @utilisateur = Utilisateur.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @utilisateur }
    end
  end

  # GET /utilisateurs/1/edit
  def edit
    @utilisateur = Utilisateur.find(params[:id])
  end

  # POST /utilisateurs
  # POST /utilisateurs.xml
  def create
    @utilisateur = Utilisateur.new(params[:utilisateur])

    respond_to do |format|
      if @utilisateur.save
        format.html { redirect_to(@utilisateur, :notice => 'Utilisateur was successfully created.') }
        format.xml  { render :xml => @utilisateur, :status => :created, :location => @utilisateur }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @utilisateur.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /utilisateurs/1
  # PUT /utilisateurs/1.xml
  def update
    @utilisateur = Utilisateur.find(params[:id])

    respond_to do |format|
      if @utilisateur.update_attributes(params[:utilisateur])
        format.html { redirect_to(@utilisateur, :notice => 'Utilisateur was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @utilisateur.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /utilisateurs/1
  # DELETE /utilisateurs/1.xml
  def destroy
    @utilisateur = Utilisateur.find(params[:id])
    @utilisateur.destroy

    respond_to do |format|
      format.html { redirect_to(utilisateurs_url) }
      format.xml  { head :ok }
    end
  end
end
