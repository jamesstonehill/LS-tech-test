require 'json'

class UsersController < ApplicationController

  def index
    @users = User.all

    @data = format_data_to_json
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
      flash[:error] = "Somethin went wrong with updating user #{@user.id}'s details"
      render('edit')
    end
  end

  private

  def format_data_to_json
    users = User.all

    # [{0 => {"day" => day, "count" => 3}}, {0 => {"day" => day, "count" => 3}}]
    # [{"date"=> date, "count" => 1},{"date"=> date, "count" => 1}]}
    data = []

    created_at_days = []

    users.each do |user|
      # set all date time objects to middle of day so they all users who signed
      # up on the same date will appear in one bar

      day = user.created_at.middle_of_day

      created_at_days << day
    end

    unique_days = created_at_days.uniq

    unique_days.each do |day|
      data.append({"date" => day, "count" => created_at_days.count(day) })
    end

    data.to_json
  end

  def name_and_favorite_game_params
    params.require(:user).permit(:name, :favorite_game)
  end
end
