class PublishersController < ApplicationController
  # GET /publisher
  # GET /publisher.json
  def index
    @publishers = Publisher.all

    @search = Publisher.search(params[:search])
    @publishers = @search.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @publisher }
    end
  end

  # GET /publisher/1
  # GET /publisher/1.json
  def show
    @publisher = Publisher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @publisher }
    end
  end

  # GET /publisher/new
  # GET /publisher/new.json
  def new
    @publisher = Publisher.new

    respond_to do |format|
      format.html # form.html.erb
      format.json { render json: @publisher }
    end
  end

  # GET /publisher/1/edit
  def edit
    @publisher = Publisher.find(params[:id])
  end

  # POST /publisher
  # POST /publisher.json
  def create
    @publisher = Publisher.new(params[:publisher])

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to @publisher, notice: 'publisher was successfully created.' }
        format.json { render json: @publisher, status: :created, location: @publisher }
      else
        format.html { render action: 'new' }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /publishers/1
  # PUT /publishers/1.json
  def update
    @publisher = Publisher.find(params[:id])

    respond_to do |format|
      if @publisher.update_attributes(params[:publisher])
        format.html { redirect_to @publisher, notice: 'publisher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action:  'edit' }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publishers/1
  # DELETE /publishers/1.json
  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy

    respond_to do |format|
      format.html { redirect_to publisher_url }
      format.json { head :no_content }
    end
  end
end
