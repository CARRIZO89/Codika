class Api::V1::RoomsController < Api::V1::BaseApiController  
  before_action :set_floor

  def index
    @rooms = Room.all
    render json: @rooms
  end

  def create
    @room = @floor.rooms.build(room_params)
    if @room.save
      render json: { room_number: @room.number }, status: 200
    else
      byebug
      render nothing: true, status: :bad_request
    end
  end

  private
  def room_params
    params.permit(:number)
  end

  def set_floor
    @floor = Floor.find(params[:floor_id])
  end
end
