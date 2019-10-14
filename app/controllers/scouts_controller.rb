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

  def edit
    @scout = Scout.find_by(id: params[:id])
  end

  def update
    @scout = Scout.find(params[:id])
    if  @scout.update_attributes(scout_update_params)
	    redirect_to show_path(params[:id]), notice: 'プロフィールを更新しました'
    else
      render 'edit'
    end
  end

  protected

    def scout_update_params
      params.require(:scout).permit(:name, :introduction, :mm_rank, :scout_flg)
    end
end
