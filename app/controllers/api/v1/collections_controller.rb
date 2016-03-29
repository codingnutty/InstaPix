require 'json'
class Api::V1::CollectionsController < ApplicationController
  respond_to :html, :json
  helper :application

  def create
    @collection = Collection.find_or_create({tag: params[:tag], start_date: params[:start_date], end_date: params[:end_date]})
    if !params[:start_date] || !params[:end_date]
      @collection.start_date = Time.now
      @collection.end_date = Time.now.to_i + 500
    end
    !params[:tag].blank? ? @tag = params[:tag] : @tag = "all"
    if @collection.id
      redirect_to action: "show", id: @collection.id
    elsif @collection.save
      @collection.get_posts(@tag, @collection.start_date, @collection.end_date)
      redirect_to action: "show", id: @collection.id
    else
      render json: @collection.errors.full_messages, status: :unprocesssable_entity
    end
  end

  def index
    @collections = Collection.all
    render :index
  end

  def show
    @collection = Collection.find(params[:id])
    @posts = @collection.insta_posts.limit(20)
    respond_with do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  private
  def collection_params
    params.require(:collection).permit(:id, :tag, :start_date, :end_date)
  end
end
