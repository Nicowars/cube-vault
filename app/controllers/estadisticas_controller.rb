class EstadisticasController < ApplicationController
  
  def show
	
  end
  def estas

  	if params[:fechain] == [""] || params[:fechafin] == [""] || (params[:opcion]!= "producto" && params[:opcion] != "usuario")
		flash[:notice]="Todos los campos deben completarse"
		render 'show'
  	else
  	fechain=params[:fechain][0]
  	fechafin=params[:fechafin][0]
  		if  fechain > fechafin
  			flash[:notice]="La fecha de cierre debe ser igual o posterior a la fecha de inicio"
			redirect_to estadisticas_show_path
  		else
			if params[:opcion] == "usuario"
				lista = Usuario.where({ created_at: (fechain..fechafin) }).order("created_at")
				params[:lista] = lista
				render 'estas'
			else
				lista = Producto.where.not(ganador: nil).where.not(ganador: "-1").where({ created_at: (fechain..fechafin)}).order("created_at")
				params[:lista] = lista
				render 'estasp'
			end
		end
  	end
  end
end
