class Api::V1::FloorsController < Api::V1::BaseApiController
  before_action :set_building

  def index
    @floors = Floor.all
    render json: @floors
  end

  def create
    @floor = @building.floors.build(floor_params)
    if @floor.save
      render json: { floor_number: @floor.number }, status: 200
    else
      render nothing: true, status: :bad_request
    end
  end

  private
  def floor_params
    params.permit(:number)
  end

  def set_building
    @building = Building.find(params[:building_id])
  end
end
