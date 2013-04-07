class Thing
  include Mongoid::Document

  field :name, type: String
  field :tags, type: Array, default: []

  validate :has_all_tag_required_fields_set

protected

  def has_all_tag_required_fields_set
    self.tags.each do |tag_name|
      tag = Tag.where(name: tag_name).try(:first)
      if tag.nil?
        errors.add(:tags, "tag_name #{tag_name} not found")
      else
        tag.required_fields.each do |required_field|
          if !self[tag_name] || self[tag_name][required_field["name"].to_sym].nil?
            errors.add(:tags, "required_field #{required_field["name"]} not set")
          end
        end
      end
    end
  end
end
