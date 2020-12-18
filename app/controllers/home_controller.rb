class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    # @products = Product.all
    @products = Product.paginate(page: params[:page], per_page: 2).order('created_at DESC')
  end
end
