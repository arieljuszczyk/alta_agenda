class HomeController < ApplicationController
  
  def show
    
  end
  
  # GET /eventos
  # GET /eventos.json
  def index
    
   @eventos = Evento.all(:order => 'fecha ASC')   
   @orden = 'fecha ASC'
 
    case params[:id_fecha]
    when "1"  #Hoy
      @DateFilter = Date.today.to_s + " 00:00:00.000000"      
      @eventos = Evento.where(:fecha => @DateFilter).all(:order => @orden)   
    when "2"  #Mañana          
      @DateFilter = Date.tomorrow.to_s + " 00:00:00.000000"  
      @eventos = Evento.where(:fecha => @DateFilter).all(:order => @orden)     
    when "3"  #Fin de semana      
      @eventos = Evento.where(:fecha => Date.today.beginning_of_week+5..Date.today.next_week.at_beginning_of_week).all(:order => @orden)         
    when "4"  #Esta semana         
      @eventos = Evento.where(:fecha => Date.today.beginning_of_week..Date.today.end_of_week).all(:order => @orden)   
    when "5"  #Este mes
      @eventos = Evento.where(:fecha => Date.today.beginning_of_month..Date.today.end_of_month).all(:order => @orden)   
    end    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventos }
    end
  end
  
end
