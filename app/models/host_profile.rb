class HostProfile < ActiveRecord::Base
  include ProfilePhoto
  include ProfileValidations
end
