module AdminHelper

  def link_agregar(path, texto)
    raw("<a href='#{path}' class='btn btn-primary'>#{texto}</a>")
  end

  def item_menu(controller, ruta)
    clase = 'active' if controller == params[:controller]
    raw("<li class='#{clase}'><a href='#{ruta}'>#{controller.capitalize}</a></li>")
  end
  
  def titulo
    @titulo || 'Alta Agenda'
  end
  
end
