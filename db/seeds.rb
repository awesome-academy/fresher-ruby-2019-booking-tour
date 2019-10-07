10.times do
  Category.create(
    name: FFaker::Name.first_name
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
    name:  FFaker::Name.last_name,
    account_number: FFaker::Code.ean,
    user_id: User.last.id,
    amount: 400
  )
end
