10.times do
  Category.create(
    name: ["Trong nước", "Nươc ngoài"]
  )
end

10.times do
  Tour.create(
    name:  FFaker::Name.last_name,
    description:  FFaker::Name.name,
    duration: rand(1..10),
    price: rand(1..20),
    category_id: Category.ids.sample
  )
end

2.times do
  BankAccount.create(
    name:  "Master Card",
    account_number: FFaker::Code.ean,
    user_id: User.last.id,
    amount: 400
  )
end

User.create(name: "Guest one", email: "guestone@gmail.com", password: "123123")
User.create(name: "Guest two", email: "guestwo@gmail.com", password: "123123")

10.times do 
  Review.create(content: "Travello awsome", tour_id: Tour.ids.sample, user_id: User.ids.sample )
end
5.times do
  Rating.create(star: rand(1..5), tour_id: Tour.ids.sample, user_id: User.ids.sample)
end
5.times do 
  Like.create(user_id: User.ids.sample, review_id: Review.ids.sample)
end