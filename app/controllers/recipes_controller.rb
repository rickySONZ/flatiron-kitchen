class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
    end
    
    def index
        @recipes = Recipe.all
    end

    def create
        @recipe=Recipe.create(recipe_params)
        
        redirect_to recipes_path
    end

    def edit 
        @recipe = Recipe.find(params[:id])
        @ingredients = Ingredient.all
    end

    def update
        recipe = Recipe.find(params[:id])
        recipe.update(recipe_params)

        redirect_to recipes_path
    end

    def show
    end

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
