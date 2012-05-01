# == Schema Information
#
# Table name: eventos
#
#  id              :integer         not null, primary key
#  artista_id      :integer
#  lugar_id        :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  fecha           :datetime
#  fecha_importado :datetime
#  nombre          :string(255)
#  hora            :time
#

class Evento < ActiveRecord::Base
  belongs_to :artista
  belongs_to :lugar
  
  validates :artista_id, :lugar_id, :fecha, :presence => { :message => "es un campo requerido. Por favor completar." }

end
