# frozen_string_literal: true
module V2
  # Posts Controller
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]

    respond_to :json

    def index
      @posts = Post.all
      render json: @posts
    end

    def show; end

    def create
      @post = Post.new(post_params)
      @post.user = @current_user
      @post.save
      render json: @post
    end

    def update
      @post.update(post_params)
      render json: @post
    end

    def destroy
      @post.destroy
      render json: @post
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:user_id, :title, :body)
    end
  end
end
