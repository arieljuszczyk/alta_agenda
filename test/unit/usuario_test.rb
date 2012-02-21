# == Schema Information
#
# Table name: usuarios
#
#  id               :integer         not null, primary key
#  apellido         :string(255)
#  nombre           :string(255)
#  login            :string(255)
#  email            :string(255)
#  clave_encriptada :string(255)
#  salt             :string(255)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
