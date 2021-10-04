Rails.application.routes.draw do
  namespace :api do
    post 'robot/0/orders', action: :orders, controller: :robots
  end
end
