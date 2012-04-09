# == Schema Information
#
# Table name: datos_importados
#
#  id            :integer         not null, primary key
#  artista       :string(255)
#  fecha         :date
#  horario       :time
#  lugar         :string(255)
#  direccion1    :string(255)
#  barrio1       :string(255)
#  web1          :string(255)
#  mail1         :string(255)
#  telefono1     :string(255)
#  source        :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  importado     :boolean
#  nombre_evento :string(255)
#  duplicado     :boolean
#

class DatoImportado < ActiveRecord::Base
  
  
  
end
