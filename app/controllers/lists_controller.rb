class ListsController < ApplicationController
  before_action :set_list, only: [:index]
  before_action :search_list, only: [:show, :update]

  def index
    @lists = List.find(session[:list]).last(5) if session[:list].present? and List.count() > 0
  end

  def create
    @list = List.new(allowed_params)
    @list.url = @list.title.downcase.parameterize

    respond_to do |format|
      if @list.save
        add_list_to_user
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :index }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @list.update_attributes allowed_params

    respond_to do |format|
        format.html { redirect_to @list}
        format.js {}
    end
  end

  def show
  end

  private

    def set_list
      @list = List.new
    end

    def search_list
      @list = List.find_by(url: params[:url])
      redirect_to "/" if @list.nil?
    end

    def allowed_params
      params.require(:list).permit(:title)
    end
    
    def add_list_to_user
      session[:list] ||= []
      session[:list] << @list.id
    end
end
