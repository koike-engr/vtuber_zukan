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
      redirect_to new_vtuber_path, alert: '作成に失敗しました。未入力の項目があります。'
    end
  end

  def show
  end

  def destroy
    @vtuber.destroy
    redirect_to vtubers_path, notice:'削除しました'
  end
  
  def edit
  end

  def update
    if @vtuber.update(vtuber_params)
      redirect_to @vtuber, notice: '変更できました!'
    else
      redirect_to edit_vtuber_path(@vtuber), alert: '変更に失敗しました。未入力の項目があります。'
    end
  end

  private
    def set_vtuber
      @vtuber = Vtuber.find(params[:id])
    end
    
    def vtuber_params
      params.require(:vtuber).permit(:name, :subscribers, :superchats, :avatar, :remove_avatar)
    end
end
