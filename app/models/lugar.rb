# == Schema Information
#
# Table name: lugares
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  direccion  :string(255)
#  url        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  mail       :string(255)
#  telefono   :string(255)
#  barrio_id  :integer
#

class Lugar < ActiveRecord::Base
  has_many :eventos  
  belongs_to :barrio
  
  validates :nombre, :direccion, :url, :mail, :telefono, :presence => { :message => "es un campo requerido. Por favor completar." }
end
