class AuthorsController < ApplicationController
  # GET /author
  # GET /author.json
  def index
    @authors = Author.all

    @search = Author.search(params[:search])
    @authors = @search.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @author }
    end
  end

  # GET /author/1
  # GET /author/1.json
  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @author }
    end
  end

  # GET /author/new
  # GET /author/new.json
  def new
    @author = Author.new

    respond_to do |format|
      format.html # form.html.erb
      format.json { render json: @author }
    end
  end

  # GET /author/1/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /author
  # POST /author.json
  def create
    @author = Author.new(params[:author])

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'author was successfully created.' }
        format.json { render json: @author, status: :created, location: @author }
      else
        format.html { render action: 'new' }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /authors/1
  # PUT /authors/1.json
  def update
    @author = Author.find(params[:id])

    respond_to do |format|
      if @author.update_attributes(params[:author])
        format.html { redirect_to @author, notice: 'author was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action:  'edit' }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    respond_to do |format|
      format.html { redirect_to author_url }
      format.json { head :no_content }
    end
  end
end
