# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @date = Date.today
    @walkers = Walker.all
  end
end
