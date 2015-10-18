class GuestProfile < ActiveRecord::Base
  include ProfilePhoto
  include ProfileValidations
end
