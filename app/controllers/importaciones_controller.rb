class ImportacionesController < AdminController
  
  def new
    
  end
  
  def create
    unless params[:archivo].nil?
      archivo = params[:archivo].tempfile
      
      while (linea = archivo.gets)
        unless linea.empty?
          linea = linea.force_encoding("UTF-8")
          dato = DatoImportado.new
          campos = linea.split('|')
          
          dato.nombre_evento = campos[0]
          dato.artista = campos[1]
          dato.fecha = campos[2]
          dato.horario = campos[3].gsub('.', ':')
          dato.lugar = campos[4]
          dato.direccion1 = campos[5]
          dato.barrio1 = campos[6]
          dato.web1 = campos[7]
          dato.mail1 = campos[8]
          dato.telefono1 = campos[9]
          dato.source = campos[10]
          dato.importado = :false
          dato.save
        end
      end
    end    

    cargar_datos_artistas
    
    render 'artistas'
  end
  
  def corregir_artista
  	artista = Artista.find(params[:id_artista])
  	nombre_incorrecto = params[:nombre_artista]

    DatoImportado.update_all "artista = '#{artista.nombre}'", "artista = '#{nombre_incorrecto}' and importado = 'f'"
    
  	cargar_datos_artistas
  	
  	render 'artistas'
  end

  def corregir_lugar
      lugar = Lugar.find(params[:id_lugar])
  	  nombre_incorrecto = params[:nombre_lugar]

      DatoImportado.update_all "lugar = '#{lugar.nombre}'", "lugar = '#{nombre_incorrecto}' and importado = 'f'"
  	  
  	  cargar_datos_lugares
  	  
  	  render 'lugares'
  end
  
  def lugares
  	  cargar_datos_lugares

  	  render 'lugares'	  
  end
  
  def eventos
  	  @eventos = DatoImportado.where(:importado => false)
  	  render 'eventos'
  end
  
  def importar
    datos = DatoImportado.where(:importado => false)
    
    datos.each do |d|
      # Si hace falta, insertar un nuevo artista
      unless Artista.exists?(:nombre => d.artista)
        artista = Artista.new
        artista.nombre = d.artista
        artista.save
	  else
	    artista = Artista.find_by_nombre(d.artista)
      end
      
      # Si hace falta, insertar un nuevo lugar
      unless Lugar.exists?(:nombre => d.lugar)
        lugar = Lugar.new
    		lugar.nombre = d.lugar
    		lugar.direccion = d.direccion1
    		lugar.url = d.web1
    		lugar.barrio = d.barrio1
    		lugar.mail = d.mail1
    		lugar.telefono = d.telefono1
    		lugar.save
	  else
	    lugar = Lugar.find_by_nombre(d.lugar)
      end
      
      # Y, por �ltimo, el evento
      evento = Evento.new
      evento.artista = artista
      evento.lugar = lugar
      evento.fecha = d.fecha
      evento.save
	  
	  # ¡Y marcar el dato como importado!
	  d.importado = true
	  d.save
    end
    
    render 'new'
  end
  
private
	def cargar_datos_lugares
		lugares = DatoImportado.order(:lugar).where(:importado => false)
		
		@lugares = Lugar.all
		
		@existentes = Array.new
		@nuevos = Array.new
		
		lugares.each do |l|
			if Lugar.exists?(:nombre => l.lugar)			  
				@existentes << l.lugar unless @existentes.include?(l.lugar)
			else
				@nuevos << l.lugar unless @nuevos.include?(l.lugar)
			end
		end
	end

	def cargar_datos_artistas
		artistas = DatoImportado.order(:artista).where(:importado => false)
		
		@artistas = Artista.all
		
		@existentes = Array.new
		@nuevos = Array.new
		
		artistas.each do |a|
		  if Artista.exists?(:nombre => a.artista)
		    @existentes << a.artista unless @existentes.include?(a.artista) 
		  else
			   @nuevos << a.artista unless @nuevos.include?(a.artista)
		  end
		end
	end
end
