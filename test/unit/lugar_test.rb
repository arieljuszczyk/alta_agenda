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
#  barrio     :string(255)
#  mail       :string(255)
#  telefono   :string(255)
#

require 'test_helper'

class LugarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
