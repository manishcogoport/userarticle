Rails.application.routes.draw do


  get 'article/read', to: "article#read"
  post 'article/create',to: "article#create"
  put 'article/update/:id',to: "article#update"
  get 'article',to: "article#find2"
  delete 'article/delete/:id',to: "article#delete"


  
  get 'user', to: "user#read"
  post 'user/create',to: "user#create"
  put 'user/update/:id',to: "user#update"
  put  'user/check/:id',to: "user#check"
  put 'user/passupdate/:id',to: "user#passupdate"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
