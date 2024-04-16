class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def test
    require 'uri'
    require 'net/http'
    
    url = URI("https://car-api2.p.rapidapi.com/api/makes?direction=asc&sort=id")
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = '80a499ac73msh28fb4d44c2ca45fp10b2dcjsn3cc78d7c6f1d'
    request["X-RapidAPI-Host"] = 'car-api2.p.rapidapi.com'
    
    response = http.request(request)
    puts response.read_body
    @cars = JSON.parse(response.body)
  end

  def index6
    if params[:query].present?
      @pagy, @posts = pagy(Post.search_posts(params[:query]))
    else
      @pagy, @posts = pagy(Post)
    end

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: 'posts', formats: [:html]), pagination: view_context.pagy_bootstrap_nav(@pagy) }
      }
    end
  end


  def index
    @posts = if params[:search]
      Post.where('title LIKE ?', "%#{params[:search]}%")
    else
      Post.all
    end

    if params[:sort_by].present? && params[:order].present?
      @posts = @posts.order(params[:sort_by] => params[:order])
    end

    @visible_values = Post.pluck(:visible).uniq

    if params[:visible].present?
      selected_visible = params[:visible]
      @posts = @posts.where(visible: selected_visible)
    end
  end

  def index5test
    @posts = Post.all
    #@posts = Post.where(visible: false).order("created_at")
    #@posts = Post.where(content: "visible").order("created_at")
  end

  def index3
    @posts = Post.all
    #@posts = Post.where(visible: false).order("created_at")
    #@posts = Post.where(content: "visible").order("created_at")
  end

  def index2 
    @posts = Post.all
    @my_var = "This is an instance variable IT WORKED"
    flash[:my_var] = @my_var
  end
  
  # GET /posts or /posts.json
  def indexsort
    @posts = case params[:sort_by]
    when 'alphabetical'
      Post.order(title: :asc)
    when 'alphabetical_reverse'
      Post.order(title: :desc)
    when 'time_posted_reverse'
      Post.order(created_at: :asc)
    when 'time_posted'
      Post.order(created_at: :desc)
    else
      Post.order(created_at: :desc)
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    flash[:notice] = "My Test"
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :visible)
    end
end
