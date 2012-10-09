Rails.application.routes.draw do

	mount PlayAuth::Engine => '/'
  mount PlayFutsal::Engine => "/", :as => "futsal"

end
