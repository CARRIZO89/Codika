class Api::V1::BuildingsController < Api::V1::BaseApiController
  
  def index
    @buildings = Building.all
    render json: {buildings: @buildings}
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      render json: @building
    else
      render nothing: true, status: :bad_request
    end
  end

  private
  def building_params
    params.require(:building).permit(:name)
  end
end
