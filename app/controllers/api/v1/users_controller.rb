class Api::V1::UsersController < Api::V1::BaseController

  before_action :check_authorization, only: %w[index]
  before_action :find_user, only: %w[show]

  def index
    search = User.ransack(params[:q])
    users = search.result.order(created_at: :desc).page(params[:page] || 1).per(params[:per_page] || 50)

    json_response(users)
  end

  def show
    render_jsonapi_response(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
