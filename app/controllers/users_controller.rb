class UsersController < ApplicationController

  def index
    @users = User.all
    #@users.build_scout
    #if Scout.find_by(scout_flg: 1).blank?
    #  @scouts = nil
    #else
    #  @scouts = Scout.find_by(scout_flg: 1)
    #end
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    #@scout = Scout.new(user_id:user_params[:id])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end

  end

  def update
  end

  def destroy
  end
   

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end



end
