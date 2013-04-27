class LocationsController < ApplicationController
  def index
    @locations = Location.all

    @search = Location.search(params[:search])
    @locations = @search.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @location = Location.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(params[:author])

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'library was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /authors/1
  # PUT /authors/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'library was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render location:  'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
  end
end
