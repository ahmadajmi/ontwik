class VideosController < ApplicationController

  # before_filter :correct_user?, :only => :edit

  require 'net/http'
  require 'json'

  def home
    @videos = Video.order('created_at DESC').all
  end

  def index
    if params[:search]
      @videos = Video.search(params[:search]).order('created_at DESC')
    elsif params[:tag]
      @videos = Video.tagged_with(params[:tag]).order('created_at DESC')
    else
      @videos = Video.all
    end
  end

  def new
  end

  def to_param
    username
  end

  def create
    req_url = URI.parse('http://api.embed.ly/1/oembed?key=a7716080853c4d6d945624885ceb9ab9&url=' + params[:video][:url].to_s)
    req = Net::HTTP::Get.new(req_url.to_s)
    res = Net::HTTP.start(req_url.host, req_url.port) {|http|
        http.request(req)
    }

    @json  = JSON.parse(res.body)

    @video = Video.new(video_params)

    @video.url              = params[:video][:url].to_s
    @video.url_type         = @json['type']

    if @video.url_type != 'video'
      redirect_to(:action => "new") and return
    end

    @video.version          = @json['version']
    @video.provider_url     = @json['provider_url']
    @video.provider_name    = @json['provider_name']

    @video.title            = @json['title']
    @video.html             = @json['html']
    @video.description      = @json['description']

    @video.author_name      = @json['author_name']
    @video.author_url       = @json['author_url']

    @video.width            = @json['width']
    @video.height           = @json['height']

    @video.thumbnail_url    = @json['thumbnail_url']
    @video.thumbnail_width  = @json['thumbnail_width']
    @video.thumbnail_height = @json['thumbnail_height']

    @video.user_id = current_user.id

    @video.save
    redirect_to @video
  end

  def show
    @video    = Video.find(params[:id])
    @likeable = @video
    @likers   = @video.likers(User)
  end

  def edit
    @user = Video.find(params[:id]).user
    @video = Video.find(params[:id])
    unless current_user == @user
      redirect_to root_url, :alert => "Access denied."
    end

  end

  def update
    @video = Video.find(params[:id])

    if @video.update(update_params)
      redirect_to @video
    else
      render 'edit'
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    redirect_to '/'
  end

  private
    def video_params
      params.require(:video).permit(:url, :tag_list)
    end

    def update_params
      params.require(:video).permit(:title, :description, :tag_list)
    end

end
