class RablController < ApplicationController
  respond_to :json

  def index
    @items = Item.all
  end
end
