class Api::DirectorsController < ApplicationController
  before_action :set_director, only: [:show, :edit, :update, :destroy]
  require 'csv'

  def index
    @directors = Director.all
  end

  def create
    csv_path = params["director"]["upload"].path 
    AddDirectorWorker.new.perform(csv_path)
    redirect_to root_path
  end

  def update
    respond_to do |format|
      if @director.update(director_params)
        format.html { redirect_to @director, notice: 'Director was successfully updated.'}
        format.json { render :show, status: :ok, location: @director }
      else
        format.html { render :edit }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @director.destroy
    respond_to do |format|
      format.html { redirect_to directors_url, notice: 'Director was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.fetch(:cert, {})
    end

end
