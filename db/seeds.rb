require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableTagGossip.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all

10.times do
  city = City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::TvShows::Community.quotes,
    email: Faker::Internet.email,
    age: rand(18..28),
    city: City.all.sample,
    password: Faker::Lorem.characters(number: 10)
  )
end

10.times do
  tag = Tag.create!(
    title: "#" + Faker::Lorem.word
  )
end

10.times do
  gossip = Gossip.create!(
    title: Faker::Book.title,
    content: Faker::Quote.unique.famous_last_words,
    user: User.all.sample,
  )
end

10.times do
  gossip = Gossip.create!(
    title: Faker::Book.title,
    content: Faker::Movie.unique.quote,
    user: User.all.sample,
  )
end

30.times do
  join_tag_gossip = JoinTableTagGossip.create!(
    tag: Tag.all.sample,
    gossip: Gossip.all.sample
  )
end

5.times do
  private_message = PrivateMessage.create!(
    content: Faker::Lorem.sentence(word_count: 10),
    sender: User.all.sample,
    recipient: User.all.sample
  )
end

40.times do
  comment = Comment.create!(
    content: Faker::Lorem.sentence(word_count: 10),
    gossip: Gossip.all.sample,
    user: User.all.sample
  )
end
