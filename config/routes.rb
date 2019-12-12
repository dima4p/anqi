Rails.application.routes.draw do
  resources :cards
  resources :notes
  resources :collections do
    resources :decks
  end

  root 'collections#index'

  # scope '(:locale)',
  #     locale: Regexp.new(I18n.available_locales.map(&:to_s).join('|')) do

  
    #root 'users#index'
  # end
end
