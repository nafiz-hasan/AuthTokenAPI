module V2
  class ItemsController < ApplicationController
    respond_to :json, :xml
    before_action :set_item, only: [:show, :update, :destroy]

    # GET /item
    def index
      @items = Item.all

      RablRails.render(@items, 'items/index', :view_path => 'app/views/v2', :format => :json)
    end

    # GET /item/1
    def show
      render json: @item
    end

    # POST /item
    def create
      @item = Item.new(item_params)

      if @item.save
        render json: @item, status: :created, location: @item
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /item/1
    def update
      if @item.update(item_params)
        render json: @item
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end

    # DELETE /item/1
    def destroy
      @item.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:name, :description)
    end
  end
end
