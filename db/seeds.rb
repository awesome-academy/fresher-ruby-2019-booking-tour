ActiveRecord::Base.transaction do
  User.create(name: "Lisa", email: "lisa@gmail.com", password: "123123")
  User.create(name: "James", email: "jamses@gmail.com", password: "123123")
  User.create(name: "Sếp", email: "admin@gmail.com", password: "123123", role: "admin")
  
  2.times do
    BankAccount.create(
      name:  "Master Card",
      account_number: FFaker::Code.ean,
      user_id: User.last.id,
      amount: 400
    )
  end
  
  Category.create(
    name: ["Tham quan","Văn hóa","Ẩm thực"].sample
  )

  100.times do
    Tour.create(
      name:  ["Đồi Vọng Cảnh", "Chùa Thiên Mụ","Các lăng tẩm Huế",  "Cầu Tràng Tiền"].sample,
      description: "Nếu đang tìm kiếm một nơi để chiêm ngưỡng toàn cảnh thành phố từ trên cao,
        bạn hãy đến Đồi Vọng Cảnh. Từ điểm nhìn trên của Lầu Vọng Cảnh, bạn sẽ được ngắm nhìn
        phong cảnh “sông nước hữu tình” của dòng sông Hương thơ mộng và những lăng tẩm, đền
        chùa cổ kính, hướng tầm mắt ra xa là trập trùng núi non hùng vĩ. Nếu có dịp, hãy ghé
        Đồi Vọng Cảnh khi bình minh lên hoặc khi hoàng hôn buông xuống, bạn sẽ thấy cả một
        góc trời xứ Huế như bừng lên trong ánh nắng mặt trời lung linh rực rỡ.
      ",
      duration: rand(1..10),
      price: rand(1..20),
      category_id: 1,
      picture_attributes: {picture_link: Rails.root.join("app/assets/images/doivongcanh.jpeg").open}
  )
  end
  50.times do
    Review.create(
    content: "Triều Nguyễn có 13 vị vua. 
      - An lăng (lăng Dục Đức, Thành Thái và Duy Tân)
      - Bồi lăng (lăng Kiến Phúc)
      - Lăng Hiệp Hoà
      - Ứng lăng (lăng Đồng Khánh)
      - Tư lăng (lăng Khải Định)",
    tour_id: Tour.ids.sample, user_id: User.ids.sample,
    picture_attributes: {picture_link: Rails.root.join("app/assets/images/pho-hang-ma.jpg").open})
  end

  40.times do
    Booking.create!(
      user_id: User.ids.sample,
      start_time: Time.zone.now,
      price: rand(23..400),
      phone_number: "0387714490",
      status: "success",
      people_number: rand(2..10),
      tour_id: Tour.ids.sample,
      address: FFaker::Address.city
    )
  end
end
