class TalksController < ApplicationController

  require 'net/http'
  require 'json'
  require 'cgi'

  before_action :authenticate_profile!, only: [:new, :create, :edit, :update, :destroy]

  impressionist actions: [:show], unique: [:session_hash]

  def home
    @talks = Talk.order('created_at DESC').all.page params[:page]
    @featured = Talk.order('view_count DESC').limit(3)
    if user_signed_in?
      followees_ids = current_user.followees(Profile)
      @activities = PublicActivity::Activity.where(owner_id: followees_ids, owner_type: "Profile").order('created_at DESC')
    end
  end

  def index
    if params[:search]
      @talks = Talk.tagged_with(params[:search]).order('created_at DESC') \
             | Talk.search(params[:search]).order('created_at DESC')
    elsif params[:tag]
      @talks = Talk.tagged_with(params[:tag]).order('created_at DESC').page params[:page]
    else
      @talks = Talk.all.page params[:page]
    end
  end

  def new
    @talk = Talk.new
  end

  def to_param
    profilename
  end

  def create
    url_encoded = CGI.escape(params[:talk][:url])
    req_url = URI.parse('http://api.embed.ly/1/oembed?key=a7716080853c4d6d945624885ceb9ab9&url=' + url_encoded)
    req = Net::HTTP::Get.new(req_url.to_s)
    res = Net::HTTP.start(req_url.host, req_url.port) {|http|
        http.request(req)
    }

    @json  = JSON.parse(res.body)

    @talk = Talk.new(talk_params)

    @talk.url              = params[:talk][:url].to_s
    @talk.url_type         = @json['type']

    if @talk.url_type != 'video'
      flash[:danger] = "This URL is not supported, talks from Youtube or Vimeo are well supported"
      redirect_to(:action => "new") and return
    end

    @talk.version          = @json['version']
    @talk.provider_url     = @json['provider_url']
    @talk.provider_name    = @json['provider_name']

    @talk.title            = @json['title']
    @talk.html             = @json['html']
    @talk.description      = @json['description']

    @talk.author_name      = @json['author_name']
    @talk.author_url       = @json['author_url']

    @talk.width            = @json['width']
    @talk.height           = @json['height']

    @talk.thumbnail_url    = @json['thumbnail_url']
    @talk.thumbnail_width  = @json['thumbnail_width']
    @talk.thumbnail_height = @json['thumbnail_height']

    @talk.profile_id = current_user.id

    if @talk.save
      @talk.create_activity :create, owner: current_user
      # flash[:notice] = "You just published a new talk. Thanks!"
      redirect_to @talk
    else
      render 'new'
    end
  end

  def show
    @talk    = Talk.find(params[:id])
    @likeable = @talk
    @likers   = @talk.likers(Profile)
    @comment = Comment.new
    @comments = @talk.comments
  end

  def edit
    @profile = Talk.find(params[:id]).profile
    @talk = Talk.find(params[:id])
    unless current_user == @profile
      redirect_to root_url, :alert => "Access denied."
    end
  end

  def update
    @talk = Talk.find(params[:id])

    if @talk.update(update_params)
      redirect_to @talk, :notice => 'Successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy

    redirect_to '/'
  end

  private
    def talk_params
      params.require(:talk).permit(:url, :topic_id, :tag_list)
    end

    def update_params
      params.require(:talk).permit(:title, :description, :topic_id, :tag_list)
    end

end
