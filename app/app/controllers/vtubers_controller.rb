class VtubersController < ApplicationController
  def index
    @vtubers = Vtuber.all
  end
  def new
    @vtuber = Vtuber.new
  end
end
