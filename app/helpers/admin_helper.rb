module AdminHelper

  def link_agregar(path, texto)
    raw("<a href='#{path}'><span class='blue'>#{texto}</span></a>")
  end

  def item_menu(controller, ruta)
    id = 'selected' if controller == params[:controller]
    raw("<li id='#{id}'><a href='#{ruta}'>#{controller}</a></li>")
  end
  
  def titulo
    @titulo || 'Alta Agenda'
  end
  
end
