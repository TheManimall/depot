class SupportRequestsController < ApplicationController

  def index
    @suppor_requests = SupportRequest.all
  end

  def update
    support_request = SupportRequest.find(params[:id])
    support_request.update(response: params.require(:support_request)[:response])
    redirect_to support_requests_path
  end
end