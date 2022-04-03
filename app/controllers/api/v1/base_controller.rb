class Api::V1::BaseController < ApplicationController
  before_action :authenticate_user!

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
end
