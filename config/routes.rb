Rails.application.routes.draw do
 root "employees#index"

 resources :employees
 # post "employees/new"
end
