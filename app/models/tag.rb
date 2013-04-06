class Tag
  include Mongoid::Document

  field :name
  field :required_fields, type: Array
  field :optional_fields, type: Array
end
