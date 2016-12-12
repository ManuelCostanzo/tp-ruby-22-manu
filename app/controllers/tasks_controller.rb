class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]
  before_action :set_list, only: [:create, :update, :destroy]
  after_action :update_list_time, only: [:destroy]

  def create
    @task = type.constantize.new(send(method_params, :task))
    @task.list_id =  @list.id

     if @task.save
      update_list_time
      render json: get_json('tasks/pending')
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @task.update_attributes send(method_params, @task.type.underscore.to_sym)
      update_list_time
      render json: get_json('tasks/show')
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to @list
  end


  private

    def set_list
      @list = @task.nil? ? List.find_by(url: params[:id]) : @task.list
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def type
      Task.types.include?(params[:task][:type]) ? params[:task][:type] : "Simple"
    end

    def method_params
      @task.nil? ? "#{type.underscore.to_sym}_params" : "#{@task.type.underscore.to_sym}_params"
    end

    def simple_params(sym)
      params.require(sym).permit(:description, :status_id, :priority_id)
    end

    def temporary_params(sym)
      params.require(sym).permit(:description, :status_id, :priority_id, :beginning, :ending)
    end

    def long_params(sym)
      params.require(sym).permit(:description, :status_id, :priority_id, :percentage)
    end

    def update_list_time
      @list.update_attributes updated_at: DateTime.now
    end    

    def get_json(partial)
      { date: date_format, html: render_to_string(partial: partial), id: @task.id, status: :ok }
    end
end