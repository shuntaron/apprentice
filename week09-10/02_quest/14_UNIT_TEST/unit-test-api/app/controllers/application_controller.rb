class ApplicationController < ActionController::API
  def get
    render json: { status: "success" }
  end
end
