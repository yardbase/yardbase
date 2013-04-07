class Tag
  include Mongoid::Document

  field :name
  field :required_fields, type: Array, default: []
  field :optional_fields, type: Array, default: []

  def self.key_type key
    tag_name, rest = key.split('.', 2)
    tag = where(name: tag_name).first

    (tag.required_fields + tag.optional_fields).detect do |field|
      field['name'] == rest
    end['type']
  end
end
