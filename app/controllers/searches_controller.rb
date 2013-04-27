class SearchesController < ApplicationController
  def index
    search = {name_contains: params[:name_contains]}

    @search     = Book.search(search)
    @books      = @search.all
    @authors    = Author.search(search)
    @publishers = Publisher.search(search)
    @locations  = Location.search(search)

  end
end
