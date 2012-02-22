class SessionsController < AdminController
  skip_filter :chequear_login 
  
  def new
  end

  def create
    usuario = Usuario.find_by_email(params[:session][:email])
    
    if usuario and Usuario.autenticar(params[:session][:email], params[:session][:password])
      sign_in usuario
      redirect_to root_path
    else
      usuarios = Usuario.all

      # Esto es solamente para poder cargar el primer usuario      
      if usuarios.nil? or usuarios.empty?
        session[:email_usuario] = 'initial_setup'
        redirect_to root_path
      else
        flash.now[:error] = t('login_invalido')
        render 'new'
      end
    end  
  end

  def destroy
  end
    
end
