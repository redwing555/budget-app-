class GroupsController < ApplicationController
  skip_before_action :authenticate_user!
  load_and_authorize_resource
  def new
    @group = Group.new
  end

  def index
    @groups = current_user.groups.all
  end

  def create
    @group = Group.new(group_params)
    current_user.groups << @group
    if @group.save
      flash[:notice] = 'group added successfully'
      redirect_to groups_path
    else
      flash[:alert] = 'group not added! please try again'
      render :new
    end
  end

  def destroy
    previous_url = request.env['HTTP_REFERER']
    group = group.find(params[:id])
    if group.destroy
      flash[:notice] = 'group successfully deleted'
    else
      flash[:alert] = 'group not deleted! please try again'
    end
    redirect_to(previous_url)
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
