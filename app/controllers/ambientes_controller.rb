class AmbientesController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize Ambiente
    @ambientes = Ambiente.all
  end

  def show
    @ambiente = Ambiente.find(params[:id])
  end

  def edit
    @ambiente = Ambiente.find(params[:id])
  end

  def new
    @ambiente = Ambiente.new
  end

  def create
    @ambiente = Ambiente.new(ambiente_params)
    if @ambiente.save
      redirect_to ambiente_path(@ambiente), notice: "Se ha creado la ficha"
    else
      render "new"
    end
  end
  def ver_ambiente
    render :template => 'ambientes/show'
  end

  private

  def ambiente_params
  params.require(:ambiente).permit(:nombre, :descripcion)
  end
end
