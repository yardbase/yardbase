class Tag
  include Mongoid::Document

  field :name
  field :required_fields, type: Array, default: []
  field :optional_fields, type: Array, default: []
end
