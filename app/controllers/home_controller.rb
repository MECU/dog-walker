class HomeController < ApplicationController
  def index
    @walkers = Walker.all
  end
end
