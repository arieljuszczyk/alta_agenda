class ImportacionesController < AdminController
  
  def new
    
  end
  
  def create
    archivo = params[:archivo].tempfile
    
    # Esto lo hago para descartar la primera línea
    encabezado = archivo.gets
    
    while (linea = archivo.gets)
      unless linea.empty?
        dato = DatoImportado.new
        campos = linea.split('|')
        
        dato.artista = campos[0]
        dato.save
      end
    end    
    
    render 'new'
  end
  
end
