RandomDataGenerator::Application.routes.draw do
  root :to => "generator#index"

  match '/generate' => "generator#generate", :via => :post, :as => :generator
end
