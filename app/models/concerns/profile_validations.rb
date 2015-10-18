module ProfileValidations
  extend ActiveSupport::Concern

  included do
    validates_presence_of :name
  end
end
