class ScoutsController < ApplicationController
  #before_action :authenticate_user!,  only: [:edit, :update]

  def new
  end

  def index
    @scouts = Scout.where(scout_flg: 1)
    @print = @scouts
    if @scouts.blank?
      @scouts = nil
    else  @scouts = search_query
    end
  end

  def show
    @scout = Scout.find(params[:id])
    @user = User.find(@scout.user_id)
  end

  def edit
    @scout = current_user.scout
    #現在のユーザーのスカウト情報か判定
      if @scout.user_id.to_s == params[:id]
        #@scout = @scout.user_id
    #別ユーザーのスカウト情報更新ページを開こうとしている場合は、nil
      else  @scout = nil
      end
      
  end

  def update
    @scout = Scout.find(params[:id])
    if  @scout.update_attributes(scout_update_params)
	    redirect_to scout_show_path(params[:id]), notice: 'プロフィールを更新しました'
    else
      render 'edit'
    end
  end

  protected

    def scout_update_params
      params.require(:scout).permit(:name, :introduction, :active_week, :mm_rank,
                                      :pugs_elo, :active_time, :playstyle,
                                      :role, :active_range, :scout_flg)
    end

    def search_query
      if params[:scout].present? && params[:scout][:mm_rank]
        Scout.where('mm_rank LIKE ?', "%#{params[:scout][:mm_rank]}%")
      else
        Scout.all
      end
    end
end
