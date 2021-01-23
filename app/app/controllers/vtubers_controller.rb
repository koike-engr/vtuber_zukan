class VtubersController < ApplicationController
  before_action :set_vtuber, only: [:edit, :update, :show, :destroy]
  
  def index
    @vtubers = Vtuber.all
  end

  def new
    @vtuber = Vtuber.new
  end
  
  def create
    @vtuber = Vtuber.new(vtuber_params)

    if @vtuber.save
      redirect_to @vtuber, notice: '追加できました!'
    else
      render :new, notice: '作成に失敗しました'
    end
  end

  def show
  end

  def destroy
    @vtuber.destroy
    redirect_to vtubers_path, notice:'削除しました'
  end
  

  private
    def set_vtuber
      @vtuber = Vtuber.find(params[:id])
    end
    
    def vtuber_params
      params.require(:vtuber).permit(:name, :subscribers, :superchats)
    end
end
