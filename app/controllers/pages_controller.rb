class PagesController < ApplicationController

  def index
    @billboards = Billboard.limit(5) 
  end

end
