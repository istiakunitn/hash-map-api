class Api::V1::HashMapsController < Api::V1::BaseController

  before_action :check_authorization, only: %w[all]

  def index
    user = User.find(params[:user_id])
    user_hash_maps = user.hash_maps
    search = user_hash_maps.ransack(params[:q])
    result = search.result.order(created_at: :desc).page(params[:page] || 1).per(params[:per_page] || 50)

    json_response(result)
  end

  def all
    search = HashMap.ransack(params[:q])
    hash_maps = search.result.order(created_at: :desc).page(params[:page] || 1).per(params[:per_page] || 50)

    json_response(hash_maps)
  end

  def create
    hash_map = HashMap.create!(hash_map_params)

    render_jsonapi_response(hash_map)
  end


  private

  def check_authorization
    unless current_user.is_super_admin?
      render json: {
        'errors': [
          {
            'status': '401',
            'title': 'unauthorized'
          }
        ]
      }, status: 401
    end
  end


  def hash_map_params
    params.require(:hash_map).permit(:user_id, :name, :description, :data)
  end
end
  