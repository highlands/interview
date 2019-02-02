class MainController < ApplicationController
  before_action :force_json, only: :search
  
  def index; end
  
  def search
    @products = Product.ransack(name_cont: params[:q]).result(distinct: true).limit(20)
  end
  
  private
  
  def force_json
    request.format = :json
  end
  
end
