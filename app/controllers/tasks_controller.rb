class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]
  before_action :set_list, :set_type

  def create
    @task = Task.new(create_params)
    @task.list_id =  @list.id
    @task.status_id = 1

     if @task.save
      update_list_time
      render json:{
                    date: date_format(@list.updated_at, 'Actualizado'), 
                    html: render_to_string(partial: 'tasks/pending'),
                    id: @task.id,
                    status: :ok
                  }
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @list = @task.list
    if @task.update_attributes update_params
      update_list_time
      render json:{
                    date: date_format(@task.updated_at, 'Actualizado'), 
                    html: render_to_string(partial: 'tasks/show'), 
                    id: @task.id,
                    status: :ok
                  }
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    update_list_time()
    redirect_to @list
  end


  private

    def set_list
      @list = List.find_by(url: params[:id]).nil? ? @task.list : List.find_by(url: params[:id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def set_type
      @type = type
    end

    def type
      Task.types.include?(params[:type]) ? params[:type] : "Simple"
    end

    def update_list_time()
      @list.update_attributes updated_at: DateTime.now
    end

    def create_params
      params.require(:task).permit(:description, :type, :priority_id, :beginning, :ending)
    end

    def update_params
      params.require(type.underscore.to_sym).permit(:description, :status_id, :priority_id, :percentage, :beginning, :ending)
    end
end