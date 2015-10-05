require "test_helper"

describe Space do
  should validate_presence_of :name
  should validate_presence_of :country
end
