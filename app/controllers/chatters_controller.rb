class ChattersController < ApplicationController
  # GET /chatters
  # GET /chatters.json
  def index

    @chatters = Chatter.all
     @alluser = User.all
    @chatter = Chatter.new(params[:chatter])

    #@curentmessage = Chatter.find_all_by_user_id(current_user.id).last.message
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chatters }
    end
  end

  # GET /chatters/1
  # GET /chatters/1.json
  def show
    @chatter = Chatter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chatter }
    end
  end

  # GET /chatters/new
  # GET /chatters/new.json
  def new
    @chatter = Chatter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chatter }
    end
  end

  # GET /chatters/1/edit
  def edit
    @chatter = Chatter.find(params[:id])
  end

  # POST /chatters
  # POST /chatters.json
  def create
    @chatter = Chatter.new(params[:chatter])
    @chatter.user_id = current_user.id
    @chatter.name = current_user.name
    respond_to do |format|
      if @chatter.save
        format.html { redirect_to :controller => "chatters", :action => "index" }
        format.json { render json: @chatter, status: :created, location: @chatter }

      else
        format.html { render action: "new" }
        format.json { render json: @chatter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chatters/1
  # PUT /chatters/1.json
  def update
    @chatter = Chatter.find(params[:id])

    respond_to do |format|
      if @chatter.update_attributes(params[:chatter])
        format.html { redirect_to :controller => "chatters", :action => "index" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chatter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatters/1
  # DELETE /chatters/1.json
  def destroy
    @chatter = Chatter.find(params[:id])
    @chatter.destroy

    respond_to do |format|
      format.html { redirect_to chatters_url }
      format.json { head :no_content }
    end
  end

end
