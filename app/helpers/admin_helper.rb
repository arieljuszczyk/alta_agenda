module AdminHelper

  def item_menu(controller, ruta)
    clase = 'first active' if controller == params[:controller]
    raw("<li class='#{clase}'><a href='#{ruta}'>#{controller}</a></li>")
  end
  
  def titulo
    @titulo || 'Alta Agenda'
  end
  
end
