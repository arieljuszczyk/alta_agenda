# == Schema Information
#
# Table name: zonas
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Zona < ActiveRecord::Base
  has_many :lugares
end
