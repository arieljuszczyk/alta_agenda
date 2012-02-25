class ImportacionesController < AdminController
  
  def new
    
  end
  
  def create
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
        dato.save
      end
    end    
    
    render 'new'
  end
  
end
