class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  require 'scylla'
end
