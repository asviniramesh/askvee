Askvee::Application.routes.draw do
  
  resources :dinners
  resources :commission_fixings 
  resources :categories do
    collection do
      get :category_list
    end
  end
  
  match '/hosts/bookings'=>'hosts#bookings'
  match '/hosts/view_guest_profile'=>'hosts#view_guest_profile'
  match '/hosts/ad_approval/:id'=>'hosts#ad_approval'
 #Host controllers
  resources:lunches
  resources:lessons
  match 'host/room_list' => 'hosts#room_list'
  match 'host/calendar_updation' => 'hosts#calendar_updation'
  resources :breakfasts
  resources :tour_guides
  
  #Guest controllers
   match 'guests/feedback' => 'guests#feesback'
    match '/guests/booking_status'=>'guests#booking_status'
    match '/guests/feedback_post' =>'guests#feedback_post'
  #Report Controller methods
  match 'reports/access_booking_per_franchisee' => 'reports#access_booking_per_franchisee'
  match 'reports/room_request_list_per_franchisee' => 'reports#room_request_list_per_franchisee'
  match 'reports/room_availability' => 'reports#room_availability'
  match 'reports/room_per_franchisee' => 'reports#room_per_franchisee'
  
  match 'reports/room_request_list' => 'reports#room_request_list'
  match 'reports/room_request_list_franchisee' => 'reports#room_request_list_franchisee'
  
  match 'reports/access_booking' => 'reports#access_booking' # admin with state
  match 'reports/access_booking_franchisee' => 'reports#access_booking_franchisee' # franchisee with state
  
  match 'reports/access_list_of_guest_host' => 'reports#access_list_of_guest_host'
  match 'reports/room_availability_in_area' => 'reports#room_availability_in_area'
  match 'reports/revenue_per_franchisee' => 'reports#revenue_per_franchisee'
  
  #Home Controller methods
  match 'registration_cancellation' => 'home#registration_cancellation'
  match '/search' => 'home#search'
  match '/search_result' => 'home#search_result'
  match '/contact_search' => 'home#contact_search'
  match '/contact_mail' => 'home#contact_mail'
  match 'reject_duplicate_entry/:id' => 'home#reject_duplicate_entry'
  match 'ad_approval/:id' => 'home#ad_approval'
  match 'invite_franchisee' => 'home#invite_franchisee'
  match 'invite_host' => 'home#invite_host'
  match 'user_list' => 'home#user_list'
  match 'franchisee_list' => 'home#franchisee_list'
  match 'host_list' => 'home#host_list'
  match 'guest_list' => 'home#guest_list'
  match 'post_advertisement_list' => 'home#post_advertisement_list'
  match 'countries/select_country_state/:id' => 'countries#select_country_state'
  resources :contents do
   collection do
    put :search
   end
  end
 
 resources :green_profiles do
   collection do
    put :search
   end
  end
  
 resources :amenities do
   collection do
    put :search
   end
  end
 resources :roles do
   collection do
    put :search
    put :search_with_user_name
    get:role_name
   end
  end
  
 resources :locations do
   collection do
    put :search
    get :city_list
    get :location_list
   end
 end
 
 resources :cities do
   collection do
    put :search
    get :state_list
   end
  end
  
 resources :states do
   collection do
    put :search
   end
  end
  
 resources :countries do
   collection do
    put :search
  end
  put :address, :on=>:collection
  end
  
 resources :accounts do
    put 'update_password', :on=>:collection
    put 'update_sign_up2',:on=>:collection
    get 'find_name',:on=>:member
    get 'show_users', :on=>:collection
    put 'update_users',:on=>:collection
   end
   
  resources :messages do
    member do
      get :users_list
      get :inbox
      get :outbox
    end
  end
  resources :attachments
  devise_for :users,:controllers => {:registrations => "registrations",:sessions=>"sessions",:passwords=>"passwords",:confirmations=>"confirmations"}
  
  #~ devise_scope :user do
    #~ get "sign_in",:to=>"sessions#new"
    #~ get "sign_up",:to=>"registrations#new"
    #~ get "logout",:to=>"devise/sessions#destroy"
  #~ end
  resources :rooms
  resources:payments do 
   collection do
    post:booking
    get:refund
   end
   end
  resources :authentications,:only=>['create']
  resources:properties
  #match '*a', :to => 'errors#routing'
  
end
