class ImportacionesController < AdminController
  
  def new
    
  end
  
  def create
    unless params[:archivo].nil?
      archivo = params[:archivo].tempfile
      
      while (linea = archivo.gets)
        unless linea.empty?
          dato = DatoImportado.new
          campos = linea.split('|')
          
          dato.artista = campos[0]
          dato.fecha = campos[1]
          dato.horario = campos[2].gsub('.', ':')
          dato.lugar = campos[3]
          dato.direccion1 = campos[4]
          dato.barrio1 = campos[5]
          dato.web1 = campos[6]
          dato.mail1 = campos[7]
          dato.telefono1 = campos[8]
          dato.source = campos[9]
          dato.importado = :false
          dato.save
        end
      end
    end    

    cargar_datos_artistas
    
    render 'artistas'
  end
  
  def corregir
	dato = DatoImportado.find(params[:id_dato])
	artista = Artista.find(params[:id_artista])
	
	dato.artista = artista.nombre
	dato.save
	
	cargar_datos_artistas
	
	render 'artistas'
  end

  def corregir_lugar
  	  dato = DatoImportado.find(params[:id_dato])
  	  lugar = Lugar.find(params[:id_lugar])
  	  
  	  dato.lugar = lugar.nombre
  	  dato.save
  	  
  	  cargar_datos_lugares
  	  
  	  render 'lugares'
  end
  
  def lugares
  	  cargar_datos_lugares

  	  render 'lugares'	  
  end
  
private
	def cargar_datos_lugares
		lugares = DatoImportado.where(:importado => false)
		
		@lugares = Lugar.all
		@existentes = Array.new
		@nuevos = Array.new
		
		lugares.each do |l|
			if Lugar.exists?(:nombre => l.lugar)
				@existentes << l
			else
				@nuevos << l
			end
		end
	end

	def cargar_datos_artistas
		artistas = DatoImportado.where(:importado => false)
		
		@artistas = Artista.all
		@existentes = Array.new
		@nuevos = Array.new
		
		artistas.each do |a|
		  if Artista.exists?(:nombre => a.artista)
			@existentes << a
		  else
			@nuevos << a
		  end
		end
	end
end
