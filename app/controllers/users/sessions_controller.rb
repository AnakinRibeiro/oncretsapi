# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json

  require 'auth_token'

  # Disable CSRF protection
  skip_before_action :verify_authenticity_token

  # POST /resource/sign_in
  def create
    # This is the default behavior from devise - view the sessions controller source:
    # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb#L16
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?

    # Here we're deviating from the standard behavior by issuing our JWT
    # to any JS based client.
    respond_to do |format|
      if User.exists?(email: params[:user][:email])
        user = User.find_for_authentication(email: params[:user][:email])

        if user.valid_password?(params[:user][:password])
          token = AuthToken.issue_token(user_id: user.id)
          format.html { redirect_to root_path, notice: "Login efetuado com sucesso!" }
          format.json { render status: 200, json: { id: user.id, name: user.name, email: user.email, birthdate: user.birthdate, cellphone: user.cellphone, token: token, language: user.language } }
        else
          format.json { render status: 404, json: { message: 'Usuário ou senha incorretos.' } }
        end
      else
        format.json { render status: 404, json: { message: 'Usuário ou senha incorretos.' } }
      end
    end
  end

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
end
