class UsersController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
    @current_user = current_user
  end
end
