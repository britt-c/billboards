class PagesController < ApplicationController

  def index
    @billboards = Billboard.all 
  end

end
