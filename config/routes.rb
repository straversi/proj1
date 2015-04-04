Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers do
    resources :pokemons
  end
  patch "capture", to: "pokemons#capture"
  patch "damage", to: "pokemons#damage"
  patch "heal", to: "pokemons#heal"
end
