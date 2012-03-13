# == Schema Information
#
# Table name: barrios
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Barrio < ActiveRecord::Base
end
