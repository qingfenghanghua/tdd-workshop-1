class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    render json: @user
  end

  def create
    user =User.new user_params
    if user.save
      render json: user, status: 201
    else
      render json: {errors: user.errors}, status:422
    end
  end

  def update
    old_user =User.find_by_id(params[:id])
    if old_user
      if old_user.update_attributes(user_params)
        render json:{},  status: 204
      end
    else
      render json: {errors:"record not found"}, status:404
    end
  end

  def destroy
    old_user =User.find_by_id(params[:id])
    if old_user
      if old_user.destroy
        render json:{}, status:204
      end
    else
      render json: {errors:"record not found"}, status:404
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


end
