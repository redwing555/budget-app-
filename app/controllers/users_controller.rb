class UsersController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
    @current_user = current_user
  end

  def index
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
