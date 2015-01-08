class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index, :edit, :delete, :update]
  before_action :require_login, only: [:show, :user_edit]
  # GET /users
  # GET /users.json
  def index
    @users = User.all.order(:login)
    @criteria = UserCriteria.new
  end


  def forget_pwd

  end


  def process_forget_pwd
    hostname = request.host || "www.pmac-group.com"
    @email = params[:email]
    unless @email.blank?
      @user = User.where("login = ?", @email).first
      unless @user.nil?
        token = Token.create(:user_id => @user.id, :date_expiration => 1.days.from_now, :code => SecureRandom.uuid)

        OrderNotifier.send_token(token.code, @user, hostname).deliver
      end
    end

    render "forget_pwd_result"
  end

  def reset_pwd
    @valid_token = false;
    @token = Token.where("code = ?", params[:token]).first
    unless @token.nil?
      if @token.date_expiration >= Time.now
        @user = User.find(@token.user_id)
        @valid_token = true if !@user.nil? && @user.state > 0
      end
    end
  end

  def process_reset_pwd
    if params[:password] == params[:confirm_password]
      user = User.find(params[:user_id])
      user.password_digest = BCrypt::Password.create(params[:password]).to_s

      if user.save
        token = Token.where("code = ? ", params[:token]).first
        token.date_expiration = -10.days.from_now
        token.save
        redirect_to root_path
      else
        render "error/500"
      end
    end
  end

  def search
    email = criteria_params[:email]

    sql = []
    unless email.blank?
      sql << "login like '%"+email + "%'"
    end

    @users = User.where(sql.join(' and ')).order(:login)
    @criteria = UserCriteria.new(criteria_params)
    render "index"
  end



  # GET /users/1
  # GET /users/1.json
  def show
  end


  # GET /users/edit
  def user_edit
    id = session[:user_id]
    @user = User.find(id)
    if @user.nil?
      flash[:error] = "You must be amin to access this section"
      redirect_to new_user_path
    end
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
    if user_params[:user_type].nil?
      @user.user_type= :normal
    end

    if user_params[:state] > 0
      @user.state = 1
    else
      @user.state = 0
    end

    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|


      if @user.update(user_params)
        format.html { redirect_to users_path }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  def criteria_params
    params.require(:user_criteria)
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :password, :password_confirmation, :user_type, :state)
    end

end
