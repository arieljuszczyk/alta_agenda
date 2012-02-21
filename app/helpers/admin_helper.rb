module AdminHelper

  def item_menu(controller, ruta)
    clase = 'active' if controller == params[:controller]    
    raw("<li><a class='#{clase}' href='#{ruta}'>#{controller}</a></li>")
  end
  
  def titulo
    @titulo || 'Alta Agenda'
  end
  
end
