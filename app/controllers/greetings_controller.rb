class GreetingsController < ApplicationController
  def index
    greeting_service = GreetingService.greet('World')


    return render json: { error: greeting_service.error },
                  status: :bad_request if !!greeting_service.error

    render json: { message: greeting_service.greeting }, status: :ok
  end

  def hello
    greeting_service = GreetingService.greet(params[:name])


    return render json: { error: greeting_service.error },
                  status: :bad_request if !!greeting_service.error

    render json: { message: greeting_service.greeting }, status: :ok
  end

  def welcome
    response = {
      message: 'Welcome to the Maple Technical Interview!'
    }

    render json: response, status: :ok
  end
end
