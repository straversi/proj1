class PokemonsController < ApplicationController

  def capture
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.trainer = current_trainer
  	@pokemon.save
	render "home/index"
  end

  def damage
    @trainer = Trainer.find(params[:trainer_id])
    @pokemons = @trainer.pokemons
    @pokemon = @pokemons.find(params[:id])
    @pokemon.health -= 10
    @pokemon.save
    render "trainers/show"
  end

  def heal
    @trainer = Trainer.find(params[:trainer_id])
    @pokemons = @trainer.pokemons
    @pokemon = @pokemons.find(params[:id])
    @pokemon.health += 10
    @pokemon.save
    render "trainers/show"
  end

  def new
    @trainer = Trainer.find(params[:trainer_id])
    @pokemon = @trainer.pokemons.build
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @pokemon = @trainer.pokemons.build(pokemon_params)
    @pokemon.level = 1
    @pokemon.health = 100
    if @pokemon.save
      redirect_to @pokemon.trainer
    else
      render "new"
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end

end
