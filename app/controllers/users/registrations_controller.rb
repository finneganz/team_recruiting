# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  #before_action :configure_sign_up_params, only: [:create]
  #before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
   # super
  # end

  # POST /resource
  def create
    begin
      ActiveRecord::Base.transaction do
        super
        ###新規登録したユーザー(親)が保有するスカウト情報(子)を作成する
        resource.build_scout
        ###スカウト名はアカウント名を設定(デフォルト)
        resource.scout.name = resource.name
        resource.save!
      end
    end
  end

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update
     super
   end

  # DELETE /resource
   def destroy
     super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # プロフィール画面用のアクションを追加
  def detail
    @user = User.find_by(id: params[:id])
    @scout = Scout.find_by(user_id: @user.id)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   "/user/#{current_user.id}"
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
