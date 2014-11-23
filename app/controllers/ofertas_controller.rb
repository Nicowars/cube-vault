class OfertasController < ApplicationController
  before_action	:get,		only: [:show, :edit, :update, :destroy]
  before_action	:new,		only: :create
  
  def get
    @oferta= Oferta.find(params[:id])
  end
  
  def new
    @oferta= Oferta.new
  end
  def index
    @ofertas= Oferta.all
  end

  def show
  end
  def edit
  end

  def create
    usu = Usuario.find(params[:oferta][:usuario_id])
    prod = Producto.find(params[:oferta][:producto_id])
  	@oferta.usuario=usu
    @oferta.producto=prod
    @oferta.detalle=params[:oferta][:detalle]
    @oferta.save
    redirect_to prod
  end
  def update
  	@oferta.usuario=params[:oferta][:usuario]
    @oferta.producto=params[:oferta][:producto]
    @oferta.detalle=params[:oferta][:detalle]
    @oferta.save
    redirect_to params[:oferta][:producto]
  end
  def destroy
    @oferta.destroy
    redirect_to ofertas_path
  end

end
