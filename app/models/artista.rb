# == Schema Information
#
# Table name: artistas
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  url        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Artista < ActiveRecord::Base
  has_many :eventos  
end
