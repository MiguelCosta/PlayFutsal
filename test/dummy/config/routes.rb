Rails.application.routes.draw do

	mount PlayAuth::Engine => '/'
  mount PlayFutsal::Engine => "/futsal", :as => "futsal"

end
