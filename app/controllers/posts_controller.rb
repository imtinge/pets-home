class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :has_found]
  before_action :authenticate_user!, only: %i[new edit create update]
  before_action :owner_user, only: %i[edit update]
  skip_before_action :verify_authenticity_token, only: :upload

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order("created_at DESC")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def upload
    @imgFile = params[:imgFile]
    unless @imgFile.nil?
      begin
        uploader = ImageUploader.new
        uploader.store!(@imgFile)
        file_url = uploader.url
        if ENV['RAILS_RELATIVE_URL_ROOT']
          file_url = ENV['RAILS_RELATIVE_URL_ROOT'] + file_url
        end
        render(plain: file_url) and return
      rescue CarrierWave::UploadError => e
        show_error(e.message) and return
      rescue Exception => e
        show_error(e.to_s) and return
      end
    else
      show_error("No File Selected!") and return
    end
  end

  private

    def show_error(msg)
      render plain: "error|#{msg}"
    end
    
    def owner_user
      unless current_user == @post.user
        redirect_to root_path, danger: 'You are not the owner of this reporter.'
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end
end
