# == Schema Information
#
# Table name: eventos
#
#  id         :integer         not null, primary key
#  artista_id :integer
#  lugar_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Evento < ActiveRecord::Base
  belongs_to :artista
  belongs_to :lugar
end
