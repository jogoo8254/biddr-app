class Api::V1::UsersController < ApplicationController
    before_action :authenticate_user!, only: [ :current ]

    def current
     render json: current_user
   end
   def create
    user = User.new user_params
    if user.save
      session[:user_id] = user.id
      render json: {id: user.id}
    else
      render(
        json: { errors: user.errors.messages },
        status: 422
      )
    end
  end

   def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
