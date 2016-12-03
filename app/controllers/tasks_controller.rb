class TasksController < ApplicationController

  def create
    @task = Task.new(task_params)
    @list = List.where('url = ?', params[:url]).first
    @task.list_id =  @list.id
    @task.status_id = 1

    update_list_time(@task.updated_at) if @task.save
    respond_to do |format|
      format.html { redirect_to @list }
      format.js   {}
    end
  end

  private

    def type
      Task.types.include?(params[:type]) ? params[:type] : "Simple"
    end

    def update_list_time(time)
      @list.update_attributes updated_at: time
    end

  def task_params
    params.require(:task).permit(:description, :type, :priority_id, :beginning, :ending)
  end
end