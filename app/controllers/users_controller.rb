class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    # only admins see the whole user list
    if current_user && current_user.is_admin
      @users = User.all
      render :index
    else
      redirect_to "/"
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  # Only let the user/admin edit their page if someone manually goes here
  def edit
    id = params[:id]
    @user = User.find(id)
    if current_user
      # have to do this, or wil get nil:nil class
      if current_user.is_admin || current_user.id == @user.id
        render :edit
      end
    else
      redirect_to "/"
    end
  end

  # POST /users
  # POST /users.json
  
  # NOTE: No way in here to make a user an admin. Did not want admins to add or remove admin status from other users. 
  # Might make a owns_site column in database to enable other people for admin status.
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # send welcome email
        YamrsMailer.welcome_email(@user).deliver
        # authenticates them
        cookies[:auth_token] = @user.auth_token
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    # Send goodbye email
    YamrsMailer.goodbye_email(@user).deliver
    @user.destroy
    cookies.delete(:auth_token)
    respond_to do |format|
      format.html { redirect_to '/', notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :picture)
    end
end
