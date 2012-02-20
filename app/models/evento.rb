class Evento < ActiveRecord::Base
  belongs_to :artista
  belongs_to :lugar
end
