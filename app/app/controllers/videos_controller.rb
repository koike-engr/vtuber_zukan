class VideosController < ApplicationController
    def index
        @vtuber = Vtuber.find(params[:vtuber_id])
        @videos = @vtuber.videos
    end
end
