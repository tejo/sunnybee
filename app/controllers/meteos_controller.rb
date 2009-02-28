class MeteosController < ApplicationController
  acts_as_iphone_controller
  
  def index
  end
  
  def lookup
    @res = MeteoLookup.meteoize(params[:location])
    respond_to do |format|
      if @res
        @sun = [19, 25, 31, 32, 33, 34, 36].include?(@res.condition.code.to_i)
        format.html
        format.iphone
        format.xml 
      else
        flash[:notice] = 'Informazioni non disponibili'
        format.html { render :action => "index" }
        format.iphone
        format.xml  { render :xml => '<lookup><error>'+flash[:notice]+'</error></lookup>' }
      end
    end
  end
  
end
