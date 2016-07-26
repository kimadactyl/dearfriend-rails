# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'yaml'
require 'carrierwave/orm/activerecord'

# Iterate our old letters
Dir.glob("../dearfriend/src/pages/letters/**").each do |d|
  if File.directory? d
    begin
      # Try and open the file
      contents = File.read("#{d}/index.md")
    rescue
      # If not, skip to the next one
      puts "not opened #{d}"
      next
    end
    # Read the file
    if (md = contents.match(/^(?<metadata>---\s*\n.*?\n?)^(---\s*$\n?)/m))
      contents = md.post_match
      meta = YAML.load(md[:metadata])

      # Make a recipient
      first_name = meta["recipient"][0, meta["recipient"].length - meta["recipient"].split.last.length - 1] rescue false
      last_name = meta["recipient"].split.last
      unless first_name
        first_name = last_name
        last_name = nil
      end
      born = Date.strptime(meta["born"].to_s, "%Y") rescue nil
      died = Date.strptime(meta["died"].to_s, "%Y") rescue nil
      website =  meta["website"] rescue false

      recipient = Recipient.create!(
        first_name: first_name,
        last_name: last_name,
        born: born,
        died: died,
        description: meta["description"],
        website: website
      )

      # Make an author
      first_name = meta["sender"][0, meta["sender"].length - meta["sender"].split.last.length - 1] rescue false
      last_name = meta["sender"].split.last
      unless first_name
        first_name = last_name
        last_name = nil
      end
      author = Author.create!(
        first_name: first_name,
        last_name: last_name
      )

      # Publish the letter
      published = DateTime.parse(meta["published"].to_s) rescue nil
      recieved = DateTime.parse(meta["received"].to_s) rescue nil

      @letter = Letter.create!(
        content: contents,
        recieved: recieved,
        published: published
      )

      File.open("#{d}/preview.jpg") do |f|
        puts "#{d}/preview.jpg"
        @letter.preview = f
      end
      @letter.save!

      if meta["images"]
        meta["images"].each_with_index do |image, idx|
          File.open("#{d}/#{image}") do |f|
            @letter.scans += [f]
          end
          @letter.save!
        end
      end

      @letter.authors << author
      @letter.recipients << recipient

    end
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
