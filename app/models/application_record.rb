class ApplicationRecord < ActiveRecord::Base
  VALID_DATE_REGEX = /\A[1-9]\d{3}-\d{2}-\d{2}\z/
  primary_abstract_class
end
