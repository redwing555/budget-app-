class OperationsController < ApplicationController
  load_and_authorize_resource
  def new
    @operation = Operation.new
  end

  def index
    @group = Group.find(params[:group_id])
    @operations = @group.operations.order('created_at DESC')
  end

  def create
    @group = Group.find(params[:group_id])
    @operation = @group.operations.create(operation_params)
    if @operation.save
      flash[:notice] = 'operation added successfully'
      redirect_to group_operations_path
    else
      flash[:alert] = 'operation not added! please try again'
      render :new
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, group_ids: []).merge(user_id: current_user.id)
  end
end
