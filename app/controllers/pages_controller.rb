class PagesController < ApplicationController

  def index
    @billboards = Billboard.limit(10) 
  end

end
