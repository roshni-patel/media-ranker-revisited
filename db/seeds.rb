require "csv"
media_file = Rails.root.join("db", "media_seeds.csv")

user = User.new(username: "roshni-patel", uid: 51972502, provider: "github", email: "rpatel01@wesleyan.edu", name: nil)
user.save!

CSV.foreach(media_file, headers: true, header_converters: :symbol, converters: :all) do |row|
  data = Hash[row.headers.zip(row.fields)]
  puts data
  data[:user_id] = user.id
  Work.create!(data)
end



