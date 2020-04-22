# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tax.destroy_all

Tax.create(province: 'Alberta', gst: 5, pst: 0)
Tax.create(province: 'British Columbia', gst: 5, pst: 7)
Tax.create(province: 'Manitoba', gst: 5, pst: 7)
Tax.create(province: 'New Brunswick', gst: 5, pst: 10)
Tax.create(province: 'Newfoundland', gst: 5, pst: 10)
Tax.create(province: 'Northwest Territories', gst: 5, pst: 0)
Tax.create(province: 'Nova Scotia', gst: 5, pst: 10)
Tax.create(province: 'Nunavut', gst: 5, pst: 0)
Tax.create(province: 'Ontario', gst: 5, pst: 8)
Tax.create(province: 'PEI', gst: 5, pst: 10)
Tax.create(province: 'Quebec', gst: 5, pst: 9.97)
Tax.create(province: 'Saskatchewan', gst: 5, pst: 6)
Tax.create(province: 'Yukon', gst: 5, pst: 0)
