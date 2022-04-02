module Response

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end
end
