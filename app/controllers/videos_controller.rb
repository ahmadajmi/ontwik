class VideosController < ApplicationController
  # def index
  # end

  require 'net/http'

  def new
  end

  def create
    # render plain: params[:video].inspect
    # debugger
    # render plain: params[:video].inspect
    # https://www.youtube.com/watch?v=AzIQjwcJcVE

    @urlurl = params[:video][:url].to_s

    puts "==================>===>==>" + @urlurl
    req_url = URI.parse('http://api.embed.ly/1/oembed?key=a7716080853c4d6d945624885ceb9ab9&url=' + params[:video][:url].to_s)
    req = Net::HTTP::Get.new(req_url.to_s)
    res = Net::HTTP.start(req_url.host, req_url.port) {|http|
        http.request(req)
    }
    puts res.body

    @video = Video.new(video_params)
    @video.save
    redirect_to @video
  end

  def show
    @video = Video.find(params[:id])
  end

  private
    def video_params
      params.require(:video).permit(:url)
    end


  # def edit
  # end

  # def destroy
  # end
end
