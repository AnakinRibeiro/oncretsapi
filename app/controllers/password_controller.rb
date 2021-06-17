class PasswordController < ApplicationController

  def reset_password_user
    if User.where(email: params[:email]).exists?
      u = User.where(email: params[:email]).first
      User.find(u.id).reset_password(params[:password], params[:password])
      render status: 200, json: { message: 'Senha alterada com sucesso.' }
    else
      render status: 400, json: { message: 'Usuário não encontrado.' }
    end
  end
end
