module SessionsHelper
  
  def sign_in(usuario)
    session[:email_usuario] = usuario.email
  end

  def logueado?
    !session[:email_usuario].nil?
  end

  def usuario_logueado
    session[:email_usuario]
  end
  
end
