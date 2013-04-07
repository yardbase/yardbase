#!/usr/bin/env bundle exec rails runner
require 'csv'

Tag.delete_all
Thing.delete_all

coffeeshop_tag = Tag.create(name: 'coffeeshop', required_fields: [
  {name: 'address', type: 'string'}
], optional_fields: [
  {name: 'url', type: 'string'},
  {name: 'phone_number', type: 'string'}
]) unless Tag.where(name: 'coffeeshop').any?

wifi_tag = Tag.create(name: 'wifi', required_fields: [
  {name: 'free', type: 'boolean'}
], optional_fields: [
  {name: 'token', type: 'boolean'},
  {name: 'time_limited', type: 'boolean'}
]) unless Tag.where(name: 'wifi').any?

location_tag = Tag.create(name: 'location', required_fields: [
  {name: 'lat', type: 'float'},
  {name: 'lng', type: 'float'}
])

music_event_tag = Tag.create(name: 'music_event', required_fields:[
  {name: 'band', type: 'string'},
  {name: 'venue', type: 'string'},
  {name: 'address', type: 'string'},
  {name: 'date', type: 'string'},
  {name: 'time', type: 'string'}
])

filename = Rails.root.join('db', 'seeds', 'madison', 'music.csv')
CSV.open(filename, headers: true, header_converters: :symbol) do |csv|
  csv.each do |row|

    sleep 0.5
    res = Geocoder.coordinates(row[:address])
    puts res
    location = {lat: res[0], lng: res[1]}

    Thing.create(
      tags: %w(music_event location),
      name: row[:band] + ' at ' + row[:venue],
      music_event: {
        venue: row[:venue],
        band: row[:band],
        genre: row[:genre],
        address: row[:address],
        date: row[:date],
        time: row[:time],
        url: row[:url]
      },
      location: location
    ).tap {|thing| puts thing.errors.inspect if thing.errors.present? }
  end
end


filename = Rails.root.join('db', 'seeds', 'madison', 'coffee.csv')
CSV.open(filename, headers: true, header_converters: :symbol) do |csv|
  csv.each do |row|
    wifi = {}
    wifi[:free] = %w(free token).include?(row[:wifi])
    wifi[:token] = true if row[:wifi] == 'token'

    sleep 0.5
    res = Geocoder.coordinates([row[:address1], row[:address2]].join(' '))
    puts res
    location = {lat: res[0], lng: res[1]}

    Thing.create(
      tags: %w(coffeeshop wifi location),
      name: row[:name],
      coffeeshop: {
        address: [row[:address1], row[:address2]].join(', '),
        phone_number: row[:phone],
        url: row[:url]
      },
      wifi: wifi,
      location: location
    ).tap {|thing| puts thing.errors.inspect if thing.errors.present? }
  end
end
