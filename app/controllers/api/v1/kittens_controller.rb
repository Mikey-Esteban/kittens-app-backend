class Api::V1::KittensController < ApplicationController

  def index
    kittens = Kitten.all.order(created_at: :asc)

    render json: KittenSerializer.new(kittens).serializable_hash.to_json
  end

  def show
    kitten = Kitten.find_by(id: params[:id])

    render json: KittenSerializer.new(kitten).serializable_hash.to_json
  end

  def create
    kitten = Kitten.create(kitten_params)

    if kitten.save
      render json: KittenSerializer.new(kitten).serializable_hash.to_json
    else
      render json: { error: kitten.errors.messages }, status: 422
    end
  end

  def update
    kitten = Kitten.find_by(id: params[:id])

    if kitten.update(kitten_params)
      render json: KittenSerializer.new(kitten).serializable_hash.to_json
    else
      render json: { error: kitten.errors.messages }, status: 422
    end
  end

  def destroy
    kitten = Kitten.find_by(id: params[:id])

    if kitten.destroy
      head :no_content
    else
      render json: { error: kitten.errors.messages }, status: 422
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :softness, :cuteness)
  end

end
