class Thing
  include Mongoid::Document

  field :tags, type: Array
end
