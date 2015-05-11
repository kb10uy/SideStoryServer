class CollectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :register, :delete]
  
  def index
    @collections = Collection.all
  end
  
  def show
  end
  
  def create
    ps = params.require(:post).permit(:name, :description,)
    @nc = Collections.new(ps)
    @nc.user_id = current_user.id
    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
end
