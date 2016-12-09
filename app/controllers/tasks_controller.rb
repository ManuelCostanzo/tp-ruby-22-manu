class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]
  before_action :set_list

  def create
    @task = type.constantize.new(create_params)
    @task.list_id =  @list.id

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
    if @task.update_attributes send("#{@task.type.underscore.to_sym}_params")
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
    update_list_time
    redirect_to @list
  end


  private

    def set_list
      @list = List.find_by(url: params[:id]).nil? ? @task.list : List.find_by(url: params[:id])
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def type
      Task.types.include?(params[:task][:type]) ? params[:task][:type] : "Simple"
    end

    def create_params
      if type == 'Temporary'
        params.require(:task).permit(:description, :type, :priority_id, :beginning, :ending)
      else
        params.require(:task).permit(:description, :type, :priority_id)
      end
    end

    def update_list_time
      @list.update_attributes updated_at: DateTime.now
    end

    def simple_params
      params.require(:simple).permit(:description, :status_id, :priority_id)
    end

    def temporary_params
      params.require(:temporary).permit(:description, :status_id, :priority_id, :beginning, :ending)
    end

    def long_params
      params.require(:long).permit(:description, :status_id, :priority_id, :percentage)
    end
end