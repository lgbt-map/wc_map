class CoordinatesController < ApplicationController
  def index
    gon.coordinates = Coordinate.all
  end

  def show
    @coordinate = Coordinate.find(params[:id])
    @facility = @coordinate.facility
  end

  def new
    @coordinate = Coordinate.new
    @coordinate.build_facility
  end

  def create
    @coordinate = Coordinate.new(coordinate_params)
    if @coordinate.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    gon.coordinates = Coordinate.joins(:facility).where(facilities: {
                                                          toilet_jp: params[:toilet_jp],
                                                          toilet_west: params[:toilet_west],
                                                          washlet: params[:washlet],
                                                          powder_room: params[:powder_room],
                                                          changing_table: params[:changing_table],
                                                          ostomate: params[:ostomate],
                                                          can_everyone: params[:can_everyone],
                                                          gender_separation: params[:gender_separation],
                                                          wheelchair: params[:wheelchair]})
    render :index
  end

  private
  def coordinate_params
    params.require(:coordinate).permit(:name, :memo, :address, :image,
                                       :latitude, :longitude,
                                       facility_attributes: [:toilet_jp, :toilet_west, 
                                                            :washlet, :powder_room, :changing_table, :ostomate,
                                                            :can_everyone, :gender_separation, :wheelchair])
  end
end
