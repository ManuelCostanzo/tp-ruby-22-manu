class ListsController < ApplicationController
  before_action :set_user_lists, :set_list, only: [:index]
  before_action :search_list, only: [:show, :update]

  def index
    set_user_lists
  end

  def create
    @list = List.new(allowed_params)
    @list.url = @list.title.downcase.parameterize

      if @list.save
        add_list_to_user
        redirect_to @list
      else
        set_user_lists
        render action: :index
    end
  end

  def update

    if @list.update_attributes allowed_params
      200
    else
      render json: @list.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
  end

  private

    def set_list
      @list = List.new
    end

    def set_user_lists
      @lists = List.find(session[:list]).last(5).reverse if session[:list].present? and List.count() > 0
    end

    def search_list
      @list = List.find_by(url: params[:id])
      redirect_to action: :index if @list.nil?
    end

    def allowed_params
      params.require(:list).permit(:title)
    end
    
    def add_list_to_user
      session[:list] ||= []
      session[:list] << @list.id
    end
end
