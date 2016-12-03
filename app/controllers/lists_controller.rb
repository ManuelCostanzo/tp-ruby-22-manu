class ListsController < ApplicationController

  def index
    @lists = List.find(session[:list]).last(5) if session[:list].present? and List.count() > 0
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(allowed_params)
    @list.url = @list.title.downcase.parameterize
    if @list.save
      add_list_to_user
      redirect_to "#{request.url}#{@list.url}" 
    else
      render action: :index
    end
  end

  def update
    @list = List.find params[:id]
    @list.update_attributes allowed_params

    respond_to do |format|
        format.html { redirect_to @list}
        format.js {}
    end
  end


  def show
      @list = List.find_by(url: params[:url])
      redirect_to home_url if @list.nil?
  end

  private
    def allowed_params
      params.require(:list).permit(:title)
    end
    
    def add_list_to_user
      session[:list] ||= []
      session[:list] << @list.id
    end
end
