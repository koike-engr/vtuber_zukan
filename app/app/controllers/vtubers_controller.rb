class VtubersController < ApplicationController
  def index
    @vtubers = Vtuber.all
  end
end
