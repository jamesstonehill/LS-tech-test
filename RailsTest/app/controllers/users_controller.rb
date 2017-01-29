require 'json'

class UsersController < ApplicationController

  def index
    # selects all users and orders them by id
    @users = User.order(:id)

    @data = get_sign_in_data_as_json
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(name_and_favorite_game_params)
      flash[:notice] = "Information successfully updated for #{@user.name || @user.id }"
      redirect_to(users_path)
    else
      flash[:error] = "Somethin went wrong with updating user #{@user.name || @user.id }'s details"
      render('edit')
    end
  end

  private

  def get_sign_in_data_as_json
    users = User.all

    data = []
    created_at_days = []

    users.each do |user|
      day = user.created_at.middle_of_day

      created_at_days << day
    end

    unique_days = created_at_days.uniq

    unique_days.each do |day|
      data.append('date' => day, 'count' => created_at_days.count(day))
    end

    data.to_json
  end

  def name_and_favorite_game_params
    params.require(:user).permit(:name, :favorite_game)
  end
end
