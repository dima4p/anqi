Rails.application.routes.draw do
  resources :collections

  root 'collections#index'

  # scope '(:locale)',
  #     locale: Regexp.new(I18n.available_locales.map(&:to_s).join('|')) do

  
    #root 'users#index'
  # end
end
