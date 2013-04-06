require 'csv'

coffeeshop_tag = Tag.create(name: 'coffeeshop', required_fields: [
  {name: 'name', type: 'string'},
  {name: 'address', type: 'string'},
  {name: 'phone_number', type: 'string'}
], optional_fields: [
  {name: 'url', type: 'string'}
]) unless Tag.where(name: 'coffeeshop').any?

wifi_tag = Tag.create(name: 'wifi', required_fields: [
  {name: 'free', type: 'boolean'}
], optional_fields: [
  {name: 'token', type: 'boolean'},
  {name: 'time_limited', type: 'boolean'}
]) unless Tag.where(name: 'wifi').any?

filename = Rails.root.join('db', 'seeds', 'madison', 'coffee.csv')
CSV.open(filename, headers: true, header_converters: :symbol) do |csv|
  csv.each do |row|
    wifi = {}
    wifi[:free] = %w(free token).include?(row[:wifi])
    wifi[:token] = true if row[:wifi] == 'token'

    Thing.create(
      tags: %w(coffeeshop wifi),
      name: row[:name],
      coffeeshop: {
        address: [row[:address1], row[:address2]].join(', '),
        phone_number: row[:phone],
        url: row[:url]
      },
      wifi: wifi
    )
  end
end
