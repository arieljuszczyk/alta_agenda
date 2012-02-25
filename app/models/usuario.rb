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
require 'digest'

class Usuario < ActiveRecord::Base
  attr_accessor :clave
  attr_accessible :apellido, :nombre, :login, :email, :clave, :clave_confirmation
  
  validates :clave, :presence => true,
                    :confirmation => true,
                    :length => { :within => 6..40 }
  
  before_save :encriptar_clave
  
  def tiene_clave?(clave_enviada)
    clave_encriptada == encriptar(clave_enviada)
  end
  
  def self.autenticar(email, submitted_password)
    usuario = find_by_email(email)
    return nil  if usuario.nil?
    return usuario if usuario.tiene_clave?(submitted_password)
  end
    
  private
  
    def encriptar_clave
      self.salt = make_salt unless tiene_clave?(clave)
      self.clave_encriptada = encriptar(clave)
    end
    
    def encriptar(string)
      secure_hash("#{salt}--#{string}")
    end
  
    def make_salt
      secure_hash("#{Time.now.utc}--#{clave}")
    end
  
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
end
