# frozen_string_literal: true

require 'csv'

# rubocop:disable all
namespace :import do
  desc 'Import prefecture and city from csv'
  task prefecture: :environment do
    path = File.join Rails.root, 'db/csv/prefectures.csv'
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        name: row['name']
      }
    end
    puts 'start to create prefectures data'
    begin
      Prefecture.create!(list)
      puts 'completed!!'
    rescue StandardError
      puts 'raised error : unKnown attribute '
    end
  end

  task city: :environment do
    path = File.join Rails.root, 'db/csv/cities.csv'
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        name: row['name'],
        prefecture_id: row['prefecture_id']
      }
    end
    puts 'start to create users data'
    begin
      City.create!(list)
      puts 'completed!!'
    rescue StandardError
      puts 'raised error : unKnown attribute '
    end
  end
  # rubocop:enable all
end
