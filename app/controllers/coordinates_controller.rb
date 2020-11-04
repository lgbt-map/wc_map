class CoordinatesController < ApplicationController
  def index
    gon.coordinates = Coordinate.all
  end

  def show
    @coordinate = Coordinate.find(params[:id])
    @facility = @coordinate.facility
    @evaluations = @coordinate.evaluations
    gon.evaluation_columns = Evaluation.column_names.slice(2.. -3)
    gon.evaluate = [@evaluations.sum(:cleanliness), @evaluations.sum(:breadth),
                    @evaluations.sum(:luxury), @evaluations.sum(:use_rate), @evaluations.sum(:security)]
    evaluations_num = @evaluations.count
    gon.data = gon.evaluate.map do |value|
      value / evaluations_num
    end
  end

  def new
    @coordinate = Coordinate.new
    @coordinate.build_facility
  end

  def create
    @coordinate = Coordinate.new(coordinate_params)
    if @coordinate.save
      @coordinate.evaluations.create(evaluation_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    param_lists = params[:column].permit!.to_hash
    gon.coordinates = Coordinate.all
    param_lists.each do |column, value|
      if value == "1"
        column = 'facilities.' + column
        gon.coordinates = gon.coordinates.joins(:facility).where("#{column} LIKE ?", true)
      end
    end
    render :index
  end

  private
  def coordinate_params
    params.require(:coordinate).permit(:name, :memo, :address, :image, :latitude, :longitude,
                                       facility_attributes: [:toilet_jp, :toilet_west,
                                                             :washlet, :powder_room, :changing_table, :ostomate,
                                                             :can_everyone, :gender_separation, :wheelchair])
  end

  def evaluation_params
    params[:coordinate].require(:evaluation).permit(:cleanliness, :breadth, :luxury, :use_rate, :security)
  end
end