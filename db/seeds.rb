# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

categories = Category.create([{name: "Đồ ngủ gợi cảm", slogan: "Girl Gone Wild", description: "Tạm rời xa phong cách dịu dàng, trở thành nữ thần ngọt ngào & nóng bỏng khó cưỡng."}, 
                              {name: "Váy nóng bỏng", slogan: "June Sexy Babe", description: "Công thức mix đồ nhấn nhá riêng biệt phá đảo mùa hè 2017 cho cô nàng gợi cảm."},
                              { name: "Phụ kiện khó cưỡng", slogan: "Pure Feels", description: "Cho chàng thấy bạn mong manh đến nhường nào."}])

categories.each do |c|
  c.products.create([
    {name: "Đầm Denim", description: "Trẻ trung, năng động cùng đầm denim dáng suông của thương hiệu ZALORA. Đầm có chất liệu denim năng động, kiểu dáng đơn giản dễ dàng phối hợp với phụ kiện.", price: 329, quantity: 15}, 
    {name: "Đầm Ren Thêu", description: "Kiểu dáng thời trang, tinh tế, kết hợp những đường may tinh xảo, tạo nên gu thời trang sành điệu của bạn gái. Màu sắc trẻ trung, năng động cho bạn nữ thêm phần nổi bật.", price: 895, quantity: 30}, 
    {name: "Áo Cardigan", description: "Cho một mùa đông ấm áp nhưng không mất đi nét tinh tế, thời thượng cùng áo khoác có nón đến từ thương hiệu ZALORA. Áo được tạo từ chất liệu dày, xù thích hợp để giữ ấm cơ thể, kiểu dáng áo suông, rộng mang lại cảm giác thoải mái cho người mặc.", price: 389, quantity: 65}, 
    {name: "Đầm A Hoa Ly Tay, Cổ Viền", description: "Đầm phong dáng suông nhẹ có thể che những khuyết điểm trên cơ thể, với chất liệu lennin không nhăn cao cấp", price: 540, quantity: 75}
  ])
end
