class Api::V1::FoodsController < ApplicationController
  before_action :jwt_authenticate

  def index
    foods = @current_user.foods
    render_json_foods(foods.as_json(except: :user_id))
  end

  def create
    food = @current_user.foods.build(food_params)
    if food.save
      render_json_result(200, food.as_json(except: :user_id))
    else
      render_json_result(500, food.errors)
    end
  end

  def update
    food = Food.find_by(id: params[:id])
    return if food.nil?
    if food.update(food_params)
      render_json_result(200, food.as_json(except: :user_id))
    else
      render_json_result(500, food.errors)
    end
  end

  def destroy
    food = Food.find_by(id: params[:id])
    return if food.nil?
    if food.destroy
      render_json_delete(200, I18n.t("message.delete"))
    else
      render_json_delete(500, I18n.t("message.invalid_delete"))
    end
  end

  private

    def food_params
      params.permit(:image_data, :name, :calorie, :purchase_date)
    end
end
