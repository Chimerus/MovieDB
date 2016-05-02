class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    if current_user && current_user.is_admin
      @reviews = Review.all
      render :index
    else
      redirect_to '/'
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    # Have to be logged in to review!
    if current_user 
      @review = Review.new
      @movie = Movie.find(params[:id])
      render :new
    else
      redirect_to '/'
    end
  end

  # GET /reviews/1/edit
  # Ensure only user who wrote it or admin can edit review
  def edit
    if current_user && (current_user.is_admin || current_user.id == @review.user.id)
    else
      redirect_to '/'
    end
  end

  # POST /reviews
  # POST /reviews.json
  def create
    # check if THIS user reviewed THIS movie
    if Review.find_by(user_id: review_params[:user_id], movie_id: review_params[:movie_id])
      flash[:error] = "You already reviewed this movie!"
      redirect_to "/movies/#{review_params[:movie_id]}"
    else
      @review = Review.new(review_params)
      @movie = Movie.find(review_params[:movie_id])

      respond_to do |format|
        if @review.save
          format.html { redirect_to '/', notice: 'Review was successfully created.' }
          format.json { render :show, status: :created, location: @review }
        else
          format.html { render :new }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    if current_user && (current_user.is_admin || current_user.id == @review.user.id)
      @review.destroy
      respond_to do |format|
        format.html { redirect_to '/', notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to "/"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:score, :comment, :user_id, :movie_id)
    end
end
