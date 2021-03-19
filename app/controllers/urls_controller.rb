class UrlsController < ApplicationController
  def create
    url = UrlService.new(long_url: params[:url]).call

    unless url.errors.empty?
      render json: { error: url.errors.full_messages }, status: :bad_request
    else
      render json: { slug: url.slug }, status: :created
    end
  end
end
