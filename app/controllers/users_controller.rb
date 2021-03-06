class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index

       if session[:user_name] 
          if @user = User.find_by(name: session[:user_name] ) 
            redirect_to @user
          else render plain: "your login is session[:user_name],please contact system admin".inspect
          end
        else 
        self.win_sso  
        @users = User.all
       end
  end

  def list
        @users = User.all

  end

  # GET /users/1
  # GET /users/1.json
  def show 
    @user = User.find(params[:id])  
    smonth = params[:smonth]
    if smonth
      sdate = "2015/" + smonth.to_s + "/01"
      sdate = sdate.to_date
    else 
    sdate = Date.today
    end
    @month = (sdate.beginning_of_month.beginning_of_week..sdate.end_of_month.end_of_week)
      


  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def report
    #render plain: params[:dateStart].inspect
  end

  def resourceallocation
    #render plain: params[:dateStart].inspect
  end

  def projectdata
    #render plain: params[:dateStart].inspect
  end
  def projectdatams
    #render plain: params[:dateStart].inspect
  end
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
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
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def login
  # render plain: params[:user].inspect
    @user = User.find_by(name: params[:user][:name]) 
    if @user
      session[:user_name] = params[:user][:name]
    #   render plain: session[:user_name] .inspect
       redirect_to @user
    else
      redirect_to "/users"
    end
  #  render plain: @user.inspect
  end
  def win_sso
       if head = request.env["HTTP_COOKIE"].to_s

          if head =~/(user_name=)(\w+);/
            user =$2
            session[:user_name] = $2
          #  render plain: head.inspect
          else render 'login'
          end
        else render 'login'
        end
  end

#  def updateeod
 #     @users = User.all
 #     @users.each do |u|
 #       u.eods.each do |e|
          #@qaeods = Qaeod.where(eod_id: e.id)
          #@qaeods.each do |q|
#          @loceods = Loceod.where(eod_id: e.id)
 #         @loceods.each do |q|
#            @loceod = q.update(:date =>e.date )         
#          end
 #       end 
  #    end
 #   end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
    params.require(:user).permit(:name, :role)
    end
end
