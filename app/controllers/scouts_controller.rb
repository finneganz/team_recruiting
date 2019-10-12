class ScoutsController < ApplicationController
  def new
  end

  def index
    @scouts = Scout.where(scout_flg: 1)
    @print = @scouts
    if @scouts.blank?
      @scouts = nil
    else
    end
  end

  def show
    @scout = Scout.find(params[:id])
    @user = User.find(@scout.user_id)
  end

end
