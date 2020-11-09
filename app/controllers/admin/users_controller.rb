class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  add_breadcrumb "Usuarios", :admin_users_path

  # GET /users
  # GET /users.json
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    add_breadcrumb @user.full_name, admin_user_path(@user)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to [:admin, @user], notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @user] }
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
        format.html { redirect_to [:admin, @user], notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @user] }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.with_attached_avatar.find_by(id: params[:id])
      redirect_to admin_users_path, alert: 'User not found on the system.' if @user.blank?
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :name, :surname, :birth_date, :dni, :address, :phone, :sex, :height, :weight, :desired_weight, :avatar, :role_ids)
    end
end
