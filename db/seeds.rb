Category.create(
  name: "Tham quan"
)
Category.create(
  name:  "Văn hóa"
)
Category.create(
  name:  "Ẩm thực"
)
Tour.create(
  name:  "Các lăng tẩm Huế",
  description: "Thời nhà Nguyễn có 13 vị vua nhưng chỉ có 7 lăng tẩm được xây dựng.
    Mỗi khu vực lăng tẩm đều được chính nhà vua lựa chọn vị trí và kiến trúc nên mỗi 
    lăng tẩm tại nơi đây lại mang những nét kiến trúc riêng với những chi tiết chạm khắc tinh xảo,
    độc đáo. Đặc sắc nhất phải kể tới Lăng Tự Đức, Lăng Minh Mạng và Lăng Khải Định.",
  duration: rand(1..10),
  price: rand(1..20),
  category_id: 1,
  picture_attributes: {picture_link: Rails.root.join("app/assets/images/Xung_Khiêm_Tạ,_Lăng_Tự_Đức.jpeg").open}
)
Tour.create(
  name:  "Chùa Thiên Mụ",
  description: "Toạ lạc trên ngọn đồi Hà Khê, tả ngạn sông Hương, chùa Thiên Mụ hiện lên giữa một không gian thiên nhiên thơ mộng
    đầy trữ tình và là khơi nguồn cảm hứng cho biết bao tác phẩm thi ca nhạc hoạ.
    Từ xa sừng sững tháp Phước Duyên cao ngất, như một biểu tượng mà bất kì ai cũng nhớ tới khi đặt
    chân đến với thành phố cố đô này. Đến Chùa Thiên Mụ, lắng nghe tiếng chùa âm vang bên tai hoà vang trong cảnh
    sắc thiên nhiên nên thơ, bạn sẽ thấy lòng mình nhẹ nhàng và thư thả hơn trước bộn bề cuộc sống.",
  duration: rand(1..10),
  price: rand(1..20),
  category_id: 1,
  picture_attributes: {picture_link: Rails.root.join("app/assets/images/chua-thien-mu6.jpg").open}
)

Tour.create(
  name:  "Đồi Vọng Cảnh",
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
Tour.create(
  name:  "Cầu Tràng Tiền",
  description: "Cầu Tràng Tiền (hay còn được gọi là Cầu Trường Tiền) bắc qua Sông Hương với
    những nhịp cầu cong cong mềm mại, uyển chuyển và là một trong những biểu tượng đặc trưng
    của cố đô Huế. Cầu Tràng Tiền còn gắn liền với lịch sử hơn 100 năm và chứng kiến biết bao
    thăng trầm của lịch sử dân tộc, địa điểm du lịch Huếtham quan chứng nhân lịch sử.
    Ngày nay, cầu được lắp đặt một hệ thống ánh sáng hiện đại, mỗi khi chiều buông lại
    toả sáng lung linh rực rỡ nhiều màu sắc.
  ",
  duration: rand(1..10),
  price: rand(1..20),
  category_id: 1,
  picture_attributes: {picture_link: Rails.root.join("app/assets/images/Hue,_le_pont_Trang_Tien.jpg").open}
)

Tour.create(
  name:  "Sông Hương",
  description: "Là biểu tượng và cũng là niềm tự hào của người dân xứ Huế, sông Hương hiền hoà
    như một dải lụa dài mềm mại dài miên man giữa mảnh đất Kinh kỳ mộng mơ. Sông Hương xanh màu
    ngọc bích, trong vắt như soi bóng cả quang cảnh thành phố nên thơ dưới mặt nước êm ả và lấp
    lánh dưới ánh nắng mặt trời. Biết bao nghệ sĩ khi đi du thuyền ngắm cảnh Hương Giang êm đềm
    và lắng tai nghe những điệu dân ca xứ Huế truyền thống nơi đây đã tìm thấy nguồn cảm hứng
    dạt dào để sáng tác nên những áng thơ văn bất hủ. Các bạn có thể lựa chọn ngay khách sạn
    ven Sông Hương để hưởng thụ chuyến du lịch trọn vẹn.
  ",
  duration: rand(1..10),
  price: rand(1..20),
  category_id: 1,
  picture_attributes: {picture_link: Rails.root.join("app/assets/images/1_102850.jpg").open}
)

Tour.create(
  name: "Du lịch Huế: Tour ẩm thực Huế",
  description: "18h:00: Xích lô đón quí khách tại khách sạn về tập trung tại 76- Lê Lợi
  18h:20: Hành trình sẽ đưa quí khách đến  Nhà Hàng “HÀNG ME ” tọa lạc trên con đường Võ Thị Sáu để thưởng thức những món bánh đặc sản của xứ Huế  ( bánh bèo, nậm, lọc, ram ít, bánh cuốn...). 
  19:15: Xích lô lại tiếp tục đưa quí khách đến “ Cồn Hến” để thưởng thức những món ăn mang đậm hương vị Huế ( cơm hến, bún hến...).
  20h:00: Dọc theo con đường Lê Lợi sát dòng Hương thơ mộng hành trình sẽ đưa quí khách đến  quán chè với một cái tên rất gần gủi với những con người bình dân của Huế quán chè Hẻm để thưởng thức các món chè của xứ Huế.( chè cốm, chè chuối, chè đạu xanh….)
  20h:45: Sau khi thưởng thức chè Huế quí khách sẽ tiếp tục chuyến hành trình đến đường Đinh Tiên Hoàng để thưởng thức các món bánh khoái và nem lụi trên đường đi quí khách sẽ được tham quan cầu Trường Tiền và Đại nội Huế về đêm dưới những ánh đèn lung linh, huyền diệu.
  Cuối chương trình  xích lô sẽ chở quí khách đi dạo trên những con đường thơ mộng để ngắm cảnh Huế về đêm. quí khách cũng có thể đi mua sắm những đặc sản, quà lưu niệm của Huế như ( Mè xửng, nón lá, tôm chua, áo dài Huế...) dưới sự hướng dẫn của các Bác xích lô.
  22h:00: kết thúc Tour, xích lô sẽ đưa quí khách về lại khách sạn.",
  duration: rand(1..10),
  price: rand(1..20),
  category_id: 2 ,
  picture_attributes: {picture_link: Rails.root.join("app/assets/images/mon_hue.jpeg").open}
)
Tour.create(
  name: "Phố cổ Hà Nội – địa điểm du lịch hấp dẫn",
  description: "Muốn tìm hiểu về cuộc sống, văn hóa và con người Tràng An thì bạn đừng bỏ qua phố cổ – một trong những địa điểm du lịch ở Hà Nội đầy thú vị và hấp dẫn với du khách. Phố cổ Hà Nội nằm ở phía Tây và phía Bắc của Hồ Hoàn Kiếm,
   là nơi tập trung đông dân cư sinh sống có 36 phố phường. Mỗi con phố ở đây chủ yếu tập trung bán một loại mặt hàng nhất định. Lang thang ở khu phố và thưởng thức ẩm thực phố cổ như phở Bát Đàn, chả cá Lã Vọng, bún chả hàng Mành, mì vằn
    thắn Đinh Liệt, bún ốc nguội Ô Quan Chưởng,…sẽ khiến chuyến đi của bạn đáng nhớ hơn rất nhiều! Lựa chọn nhiều khách sạn Phố Cổ để tận hưởng ẩm thực nơi đây.",
  duration: rand(1..10),
  price: rand(1..20),
  category_id: 2,
  picture_attributes:
    {picture_link: Rails.root.join("app/assets/images/pho-co-ha-noi-1-768x498.jpg").open}
)
Tour.create(
  name: "Món ăn ngon khi du lịch Hà Nội",
  description: "Có lẽ khi nhắc tới những món ăn khi du lịch Hà Nội không thể không nhắc tới món phở ,
   bởi đây là món ăn đặc trưng của người dân Hà Thành từ bao đời nay. Phở Hà Nội có rất nhiều loại trong đó phải kể đến phở bò (Lò Đúc, bờ hồ), phở gà (Quán Thánh, Tôn Đức Thắng), phở áp chảo (Bát Đàn) hay phở cuốn (Tây Hồ)…Mỗi loại phở đều có những hương vị đặc trưng riêng nhưng đều rất ngon và hấp dẫn.
    Nếu tới thăm Hà Nội mà chưa được thưởng thức phở thì coi như chưa từng tới Hà Nội, phở là món ăn khi du lịch Hà Nội bạn nên thưởng thức.",
  duration: rand(1..10),
  price: rand(1..20),
  category_id: 3,
  picture_attributes: {picture_link: Rails.root.join("app/assets/images/bun-dau-mam-tom.jpg").open}
)
Tour.create(
  name: "Phố ẩm thực Hàng Buồm, Tạ Hiện",
  description: "Phố Hàng Buồm được ví như một Hà Nội thu nhỏ hiện đại, tấp nập và đông đúc.
   Đến đây, bạn sẽ có cơ hội được đắm chìm trong cả một thiên đường ẩm thực, từ những món ăn
    truyền thống của người Việt cho đến vô vàn các thức quà lạ lẫm từ khắp nơi trên thế giới.",
  duration: rand(1..10),
  price: rand(1..20),
  category_id: 3,
  picture_attributes: {picture_link: Rails.root.join("app/assets/images/mon_hanoi.jpeg").open}
)
2.times do
  BankAccount.create(
    name:  "Master Card",
    account_number: FFaker::Code.ean,
    user_id: User.last.id,
    amount: 400
  )
end

User.create(name: "Lisa", email: "lisa@gmail.com", password: "123123")
User.create(name: "James", email: "jamses@gmail.com", password: "123123")
User.create(name: "Sếp", email: "admin@gmail.com", password: "123123", role: "admin")

Review.create(content: "Review Huế 3n2d 
  Mình đi 1 mình ạ ?
  * Phương tiện di chuyển tới Huế:
  Lúc đi mình đi tàu hoả SE3, 19h30 từ ga Hà Nội đi, 8h30p tới Huế, giá 830k, đi taxi đến ks 30k nữa.
  Tàu hoả là một phương tiện du lịch thú vị cho những ai muốn dành thời gian chiêm ngưỡng vẻ đẹp hai bên đường :))). Còn nếu các bạn không muốn mất quá nhiều thời gian để di chuyển thì hãy đặt vé máy bay tới Sân bay Phú Bài, chỉ mất tầm gần 1 tiếng vi vu trên bầu trời là tới HN thôi :)))
  * Chỗ ở:
  Thực ra mình cũng ko quan trọng lắm về chỗ ở, vì mình dành thời gian lớn là đi chơi, chỉ cần gần trung tâm là okie rồi, share trên booking là có ạ :))).
  * Địa điểm du lịch mình đi:
  -Đại Nội Huế:
  Đến Huế mình thuê xe máy ở ks (100k/1 ngày) rồi đi Đại Nội luôn( giá vé 150k), gửi xe gần mấy khẩu thần công (10k), rồi đi bộ mỏi chân luôn, nhưng bù lại là những khung cảnh tuyệt đẹp của Đại Nội :)))
  -Các lăng tẩm: 
  Mình đi 2 lăng :
  Lăng Khải Định: mang kiến trúc kết hợp giữa phương Đông và Phương Tây
  Lăng Tự Đức: thơ mộng, hữu tình
  -Hồ Thuỷ Tiên: Mình đến thì bị chú bảo vệ không cho vào, đành ngậm ngùi quay xe ra về ( về sau nghe thông tin là chú chỉ đuổi vờ thôi, năn nỉ tí chút là đc vào à, tiếc quá )
  -Chùa Thiên Mụ
  -Đồi Vọng Cảnh
  -Quốc Học Huế
  -Điện Hòn Chén
  -Nhà Thờ Phủ Cam
  -Biển Thuận An
  -Trung tâm Nghệ thuật Lê Bá Đảng
  -Chợ Đông Ba
  -Cafe Gác Trịnh: dành cho ai yêu dòng nhạc Trịnh ạ.
  Tối đến thì đi bộ ra chân cầu Tràng Tiền chơi, đi thuyền ra sông Hương nghe những điệu hò, dân ca xứ Huế nữa.
  •Ăn uống ở Huế:
  -Chè hẻm: số 1 kiệt 28 Hùng Vương, có nhiều loại chè lắm, nhưng nổi tiếng nhất là chè bột lọc thịt heo được xem là đặc sản của chè hẻm Huế
  -Cơm hến, bún hến: Quán chị Nhỏ trong ngõ ngã tư Phạm Hồng Thái – Trương Định, nhưng nghe nói chỉ bán mỗi buổi sáng thôi 10k/1 bát, có cả sữa đậu nành, sữa đậu ván... có 5k/1 cốc hoặc bạn có thể đến cơm hến bà Cam số 2 Trương Định gần đó.
  -Bún bò Huế: quán Cẩm 45 Lê Lợi, Phú Hội, nước dùng ngon, đậm đà, thực phẩm tươi nhưng giá hơi mắc(60k/1 bát) hoặc bạn có thể đến bún bò Huế bà Xuân 17 Lý Thường Kiệt
  -Bánh bèo nậm lọc bà Đỏ: 8 Nguyễn Bỉnh Khiêm, Phú Cát...
  Kết thúc chuyến hành trình, mình book grab đến sân bay Phú Bài bay về HN, tạm biệt Huế mộng mơ, hẹn gặp lại vào một dịp gần nhất ạ :)))
  ",
   tour_id: 13, user_id: User.ids.sample,
   picture_attributes: {picture_link: Rails.root.join("app/assets/images/Lang-Tu-Duc-1-768x446.png").open} )

   Review.create(
     content: "Triều Nguyễn có 13 vị vua. Ngoài vua Hàm Nghi và vua Bảo Đại được chôn cất ở Pháp, 11 vị vua còn lại được an táng lăng tẩm tại Việt Nam.
      Thừa Thiên Huế hiện nay có 9 lăng vua nhưng thực tế chỉ có 8 lăng vì lăng vua Kiến Phúc (Bồi lăng) nằm trong khuôn viên của lăng vua cha Tự Đức (Khiêm lăng). Lăng vua Hiệp Hoà được người dân Huế xây dựng năm 2013 (vua Hiệp Hoà là phế đế nên không được xây cất lăng mộ) nên công trình này không nằm trong diện bảo tồn của danh sách lăng tẩm các vua nhà Nguyễn của Trung tâm Bảo tồn Di tích Cố đô Huế. Danh sách này vì vậy chỉ có 7 lăng.
      9 Lăng tẩm các đời vua Nguyễn ở Tây Nam thành phố Huế bao gồm:
      - Thiên Thọ lăng (lăng Gia Long)
      - Hiếu lăng (lăng Minh Mạng)
      - Xương lăng (lăng Thiệu Trị)
      - Khiêm lăng (lăng Tự Đức)
      - An lăng (lăng Dục Đức, Thành Thái và Duy Tân)
      - Bồi lăng (lăng Kiến Phúc)
      - Lăng Hiệp Hoà
      - Ứng lăng (lăng Đồng Khánh)
      - Tư lăng (lăng Khải Định)
      Lăng Minh Mạng, lăng Tự Đức và lăng Khải Định là 3 công trình lăng tẩm có kiến trúc công phu nhất nên thường được biết đến rộng rãi hay đưa vào chương trình tham quan của các công ty du lịch và có thu phí cổng 55 ngàn/ vé. Lăng Thiệu Trị đang được trùng tu nên đã bắt đầu nhận tiền vé của du khách (30 ngàn/ vé – Thời giá giữa tháng 1 năm 2015). An Lăng và Ứng lăng miễn phí vé vào cổng. Lăng Hiệp Hoà là lăng hiếm người biết đến nhất có vị trí nằm giữa rừng, trong khu nghĩa trang thành phố nên không thu phí.
      Thời lộ tốt nhất để đi 9 lăng vua Nguyễn là hai ngày bằng phương tiện xe máy. Một ngày để đi các lăng vua Gia Long, Minh Mạng và Khải Định ở vị trí khá xa. Một ngày để đi 5 lăng còn lại: Khiêm lăng, Bồi lăng, Xương lăng, lăng Hiệp Hoà và An lăng.
      Điểm mốc bắt đầu tốt nhất để các bạn có thể đi hết tất cả 9 lăng là Đàn Nam Giao ở cuối đường Điện Biên Phủ. Khoảng cách từ trung tâm thành phố đến Đàn tương đương với đoạn đường từ Ngã 4 Hàng xanh/ Ngã 6 Cộng Hoà đến Dinh Độc Lập. Nhìn trên bản đồ có thể các bạn thấy xa nhưng với những người đã quen ngang dọc trên đường phố Sài Gòn, từ quận 10 đến Bình Thạnh chỉ như một cái búng cức mũi thì chắc chắn, bạn sẽ thấy đường đến sơn lăng gần hơn bạn nghĩ rất nhiều.
      Vật dụng cần thiết nhất khi đi các bạn nên chuẩn bị là nước suối và dù. Vì mỗi lăng sẽ tham quan trong thời gian không ngắn nên nón không thật sự hữu ích. Ngoài ra, với những bạn hiếm khi phải đi bộ nhiều, chỉ cần hoàn thành một lăng hai chân bạn sẽ rã rời, dù là một công cụ tốt để thay cho gậy. Dù còn tốt hơn nón cho một ngày mưa, che cây dù trong suốt đi vòng vòng quanh lăng nhìn rất là.. bảnh.
      Tại sao các lăng tẩm lại nằm ở hướng Tây Nam. Câu trả lời sẽ xuất hiện trong các phần kế tiếp.",
    tour_id: 18, user_id: User.ids.sample,
    picture_attributes: {picture_link: Rails.root.join("app/assets/images/langtam.jpeg").open})
    10.times do
      Review.create(
      content: "Triều Nguyễn có 13 vị vua. Ngoài vua Hàm Nghi và vua Bảo Đại được chôn cất ở Pháp, 11 vị vua còn lại được an táng lăng tẩm tại Việt Nam.
        Thừa Thiên Huế hiện nay có 9 lăng vua nhưng thực tế chỉ có 8 lăng vì lăng vua Kiến Phúc (Bồi lăng) nằm trong khuôn viên của lăng vua cha Tự Đức (Khiêm lăng). Lăng vua Hiệp Hoà được người dân Huế xây dựng năm 2013 (vua Hiệp Hoà là phế đế nên không được xây cất lăng mộ) nên công trình này không nằm trong diện bảo tồn của danh sách lăng tẩm các vua nhà Nguyễn của Trung tâm Bảo tồn Di tích Cố đô Huế. Danh sách này vì vậy chỉ có 7 lăng.
        9 Lăng tẩm các đời vua Nguyễn ở Tây Nam thành phố Huế bao gồm:
        - Thiên Thọ lăng (lăng Gia Long)
        - Hiếu lăng (lăng Minh Mạng)
        - Xương lăng (lăng Thiệu Trị)
        - Khiêm lăng (lăng Tự Đức)
        - An lăng (lăng Dục Đức, Thành Thái và Duy Tân)
        - Bồi lăng (lăng Kiến Phúc)
        - Lăng Hiệp Hoà
        - Ứng lăng (lăng Đồng Khánh)
        - Tư lăng (lăng Khải Định)",
      tour_id: Tour.ids.sample, user_id: User.ids.sample,
      picture_attributes: {picture_link: Rails.root.join("app/assets/images/pho-hang-ma.jpg").open})
    end
Review.create(content: "Quán phở Cồ trên đường Hoàng Quốc Việt được thực khách đánh giá là có mức giá cả phải chăng. Vị phở ở đây không dậy mùi quế, hồi hay các loại hương liệu khác mà chỉ đơn giản có bánh phở, nước dùng, thịt bò, rau thơm, hành và gừng. Đây cũng là một nét đặc trưng riêng của quán thu hút thực khách.
  Đặc biệt, bánh phở ở đây được làm truyền thống nên bánh rất dai, gia vị gia giảm rất vừa miệng, thịt bò mềm ngọt chuẩn vị thịt bò tươi.
  Bởi vậy, nếu bạn đang băn khoăn không biết nên ăn phở Hà Nội ở đâu ngon có thể tới với quán phở Cồ tại số 455 Hoàng Quốc Việt, quận Cầu Giấy, Hà Nội",
    tour_id: 26, user_id: User.ids.sample,
    picture_attributes: {picture_link: Rails.root.join("app/assets/images/phoco.jpg").open}
)
3.times do
  [1..3]
  Like.create(user_id: User.ids.sample, review_id: Review.ids.sample)
end