class VideosController < ApplicationController
  # def index
  # end

  require 'net/http'
  require 'json'

  def index
    @videos = Video.all
  end

  def new
  end

  def create
    # render plain: params[:video].inspect
    # debugger
    # https://www.youtube.com/watch?v=AzIQjwcJcVE

    @video = current_user.videos.build(video_params)

    @url = params[:video][:url].to_s

    # puts "==================>===>==>" + @url
    # req_url = URI.parse('http://api.embed.ly/1/oembed?key=a7716080853c4d6d945624885ceb9ab9&url=' + params[:video][:url].to_s)
    # req = Net::HTTP::Get.new(req_url.to_s)
    # res = Net::HTTP.start(req_url.host, req_url.port) {|http|
    #     http.request(req)
    # }

    # # puts JSON.parse(res.body)

    # @json = JSON.parse(res.body)

    # @video = Video.new(video_params)

    # @video.url              = @json['provider_url']
    # @video.url_type         = @json['type']
    # @video.version          = @json['version']
    # @video.provider_url     = @json['provider_url']
    # @video.provider_name    = @json['provider_name']

    # @video.title            = @json['title']
    # @video.html             = @json['html']
    # @video.description      = @json['description']

    # @video.author_name      = @json['author_name']
    # @video.author_url       = @json['author_url']

    # @video.width            = @json['width']
    # @video.height           = @json['height']

    # @video.thumbnail_url    = @json['thumbnail_url']
    # @video.thumbnail_width  = @json['thumbnail_width']
    # @video.thumbnail_height = @json['thumbnail_height']

    # @video.save
    @video.save()
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
