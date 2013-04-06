require 'spec_helper'

describe 'Coffeeshop functional spec' do
  specify 'starting to make our first coffeeshop' do
    tag = Tag.new(name: 'coffeeshop', required_fields: [
      {name: 'name', type: 'string'},
      {name: 'address', type: 'string'},
      {name: 'phone_number', type: 'string'}
    ], optional_fields: [
      {name: 'url', type: 'string'}
    ])

    wifi_tag = Tag.new(name: 'wifi', required_fields: [
      {name: 'free', type: 'boolean'}
    ], optional_fields: [
      {name: 'token', type: 'boolean'},
      {name: 'time_limited', type: 'boolean'}
    ])

    indie_coffee = Thing.new(
      tags: %w(coffeeshop wifi),
      coffeeshop: {
        name: 'Indie Coffee',
        address: '1225 Regent St, Madison, WI 53715',
        phone_number: '608-259-9621',
      },
      wifi: {
        free: true
      }
    )

    expect(indie_coffee.coffeeshop[:name]).to eq('Indie Coffee')
  end
end
