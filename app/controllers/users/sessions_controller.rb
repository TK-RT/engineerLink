# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def new_guest
    user = User.find(1)
    user.update(email: 'guest@example.com',
                last_name: 'ゲスト',
                first_name: 'ユーザー',
                last_name_kana: 'ゲスト',
                first_name_kana: 'ユーザー',
                birthday: '2020-1-1',
                gender: '男性',
                postcode: '1112222',
                prefecture: '東京都',
                address: '千代田区',
                phone_number: '00000000000') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path
  end

end
