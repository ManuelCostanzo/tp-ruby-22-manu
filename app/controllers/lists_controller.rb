class ListsController < ApplicationController
  before_action :get_user_lists, only: [:index]
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    get_user_lists
    @list = List.new
  end

  def show
    DateCheckerJob.perform_later @list
  end

  def create
    @list = List.new(allowed_params)
    
    if @list.save
      set_user_list
      redirect_to @list
    else
      get_user_lists
      render action: :index
    end
  end

  def update

    if @list.update_attributes allowed_params
      render json: {date: date_format, status: :ok}
    else
      render json: @list.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    session[:list].delete @list.id if !session[:list].nil? #el if es por si se quiere borrar la lista-0(seed)
  	@list.destroy

  	redirect_to list_path
  end

  private

    def set_list
      @list = List.find_by(url: params[:id])
      redirect_to action: :index if @list.nil?
    end
    
    def set_user_list
      session[:list] ||= []
      session[:list] << @list.id
    end

    def get_user_lists
      @lists = List.find(session[:list]).last(5).reverse if session[:list].present?
    end

    def allowed_params
      params.require(:list).permit(:title)
    end
end
