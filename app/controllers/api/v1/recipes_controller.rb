class Api::V1::RecipesController < Api::V1::ApiController
  # before_action :set_contact, only: [:show, :update, :destroy]
  # before_action :require_authorization!, only: [:show, :update, :destroy]

  # GET /api/v1/recipes
  def index
    recipes = Recipe.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'Loaded recipes', data:recipes}, status: :ok
  end


  # GET /api/v1/recipes/1
  def show
    recipe = Recipe.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded recipe', data:recipe}, status: :ok
  end


  # POST /api/v1/recipes
  def create
    recipe = Recipe.new(recipe_params)

    if recipe.save
      render json:{status: 'SUCCESS', message: 'Saved recipe', data:recipe}, status: :ok
    else
      render json:{status: 'ERROR', message: 'Recipe not saved', data:recipe.errors},
      status: :unprocessable_entity
    end
  end

 
  # DELETE /api/v1/recipes/1 
  def destroy
    recipe = Recipe.fin(params[:id])
    recipe.destroy
    render json:{status: 'SUCCESS', message: 'Deleted recipe', data:recipe}, status: :ok
  end


  # PUT /api/v1/recipes/1
  def update
    recipe = Recipe.fin(params[:id])
    if recipe.update_attributes(recipe_params)
      render json:{status: 'SUCCESS', message: 'Updated recipe', data:recipe}, status: :ok
    else
      render json:{status: 'ERROR', message: 'Recipe not updated', data:recipe.errors},
      status: :unprocessable_entity
    end
  end


  private


  def recipe_params
    params.permit(:name, :ingredients, :how_to, :metadata, :category)
  end


  def require_authorization!
      unless current_user == @contact.user
        render json: {}, status: :forbidden
      end
  end
end
