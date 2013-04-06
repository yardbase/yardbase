class Thing
  include Mongoid::Document

  field :name, type: String
  field :tags, type: Array
end
