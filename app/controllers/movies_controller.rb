class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
# ONLY ADMIN can add, edit or delete movies!

  # GET /movies
  # GET /movies.json

  # using @ page, so can recycle the index page for both index and search results
  def index
    # pagination using gem!
    @movies = Movie.all.paginate(:page => params[:page], :per_page => 6)
    @page = "Welcome to Yet Another Movie Review Site!"
  end

  def search
    # regex and using params for safety
    @movies = Movie.where('title~*?', params[:search]).paginate(:page => params[:page], :per_page => 6)
    @page = "Search Results"
    if @movies.empty?
      @sorry = "No results found"
    end
    # Explicitly tell it to render this template, recycle the index view!
    render :index
  end

  # GET /movies/1
  # GET /movies/1.json
  # Keep this, don't break default Rails (set_movie, paths)
  def show
  end

  # GET /movie/friendly_url <- note its movie, not movies!
  # ALT show, these "friendy urls" only from the home index page
  # Thought about paginating the reviews, but decided to keep one db query instead
  def show_friendly
    @movie = Movie.find_by(friendly_url: params[:friendly_url])
    # Explicitly tell it to render this template, no need to make a different show view
    render :show
  end

  # GET /movies/new
  def new
    # locks adding movies to admin
    if current_user.is_admin
      @movie = Movie.new
    else
      redirect_to '/'
    end
  end

  # GET /movies/1/edit
  def edit
    # locks editing movies to admin
    if current_user.is_admin
      @movie = Movie.find(params[:id])
    else
      redirect_to '/'
    end
  end

  # POST /movies
  # POST /movies.json
  def create
    # locks adding movies to admin
    if current_user.is_admin
      @movie = Movie.new(movie_params)
      respond_to do |format|
        if @movie.save
          format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
          format.json { render :show, status: :created, location: @movie }
        else
          format.html { render :new }
          format.json { render json: @movie.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to '/'
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    # locks editing movies to admin
    if current_user.is_admin
      respond_to do |format|
        if @movie.update(movie_params)
          format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
          format.json { render :show, status: :ok, location: @movie }
        else
          format.html { render :edit }
          format.json { render json: @movie.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to '/'
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    # locks removing movies to admin
    if current_user.is_admin
      @movie.destroy
      respond_to do |format|
        format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to '/'
    end
  end

  private
    # TODO was thinking might use this to dry code a bit, but its pretty basic as is.
    def admincheck(code)
      if current_user.is_admin
        code
      else
        redirect_to '/'
      end
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :picture, :description)
    end
end
