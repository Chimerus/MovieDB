class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
# ONLY ADMIN can add, edit or delete movies!

  # GET /movies
  # GET /movies.json

  # using @ page, so can recycle the index page for both index and search results
  def index
    @movies = Movie.all.paginate(:page => params[:page], :per_page => 6)
    @page = "Welcome to Yet Another Movie Review Site!"
  end

  def search
    # regex and using params for safety
    @movies = Movie.where('title~*?', params[:search])
    @page = "Search Results"
    if @movies.empty?
      @sorry = "No results found"
    end
    render :index
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    # url=params[:friendly_url]
    # @movie = Movie.find(params[:friendly_url])
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
    # TODO thinking might use this to dry code a bit.
    def admincheck
      if current_user.is_admin
        @is_admin = true
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
