import '../../models/post.dart';

class PostManager {
  final List<Post> _items = [
    Post(
      id: 'p1',
      title: 'Red Shirt',
      content:
          'Trở lại nước bạn Lào anh em sau 4 năm xa cách, mọi thứ đều đã quá khác biệt. Ký ức cũng dần loãng ra bởi có quá nhiều chuyến đi khác lấp đầy, nhưng nét bình yên, nhịp sống chậm và sự hiền hoà của Lào vẫn vương vất trong tiềm thức như một loại nước hoa lưu hương.Lào có lẽ là nước dễ đi nhất, khi mà hôm trước Trang Hí mới nhắn bảo muốn đi đâu đó ăn mừng sinh nhật hai đứa thì hôm sau đã từ Đà Nẵng ra tới Hà Nội vào sáng tinh mơ, rồi chiều tối là Hí và Chó đã dắt díu nhau lên xe khách đi Lào luôn mà chẳng cần một lịch trình cụ thể.ởi Lào đang bình yên và đẹp lắm, nên mình muốn viết thật rõ ràng, trả lại cho Lào một bộ ảnh đẹp đẽ, bù đắp lại lần đầu phượt du lịch Lào 8 ngày 7 đêm chỉ hết 3,7tr style siêu bụi siêu nghèo ngày xưa. Bởi vì Lào xứng đáng, rất xứng đáng trở thành một chốn thanh tịnh, an yên ta có thể tìm đến vào một mùa thu mộng mơ như thế này.tối là Hí và Chó đã dắt díu nhau lên xe khách đi Lào luôn mà chẳng cần một lịch trình cụ thể.ởi Lào đang bình yên và đẹp lắm, nên mình muốn viết thật rõ ràng, trả lại cho Lào một bộ ảnh đẹp đẽ, bù đắp lại lần đầu phượt du lịch Lào 8 ngày 7 đêm chỉ hết 3,7tr style siêu bụi siêu nghèo ngày xưa. Bởi vì Lào xứng đáng, rất xứng đáng trở thành một chốn thanh tịtối là Hí và Chó đã dắt díu nhau lên xe khách đi Lào luôn mà chẳng cần một lịch trình cụ thể.ởi Lào đang bình yên và đẹp lắm, nên mình muốn viết thật rõ ràng, trả lại cho Lào một bộ ảnh đẹp đẽ, bù đắp lại lần đầu phượt du lịch Lào 8 ngày 7 đêm chỉ hết 3,7tr style siêu bụi siêu nghèo ngày xưa. Bởi vì Lào xứng đáng, rất xứng đáng trở thành một chốn thanh tị',
      author: 'Lê Diểm Trinh',
      imageUrl:
          'https://dulichchat.com/wp-content/uploads/2022/10/du-lich-lao-thai-lan-dulichchat-5.jpg',
      isFavorite: true,
    ),
    Post(
      id: 'p2',
      title: 'ọi thứ đều đã quá khác b',
      content:
          'Trở lại nước bạn Lào anh em sau 4 năm xa cách, mọi thứ đều đã quá khác biệt. Ký ức cũng dần loãng ra bởi có quá nhiều chuyến đi khác lấp đầy, nhưng nét bình yên, nhịp sống chậm và sự hiền hoà của Lào vẫn vương vất trong tiềm thức như một loại nước hoa lưu hương.Lào có lẽ là nước dễ đi nhất, khi mà hôm trước Trang Hí mới nhắn bảo muốn đi đâu đó ăn mừng sinh nhật hai đứa thì hôm sau đã từ Đà Nẵng ra tới Hà Nội vào sáng tinh mơ, rồi chiều tối là Hí và Chó đã dắt díu nhau lên xe khách đi Lào luôn mà chẳng cần một lịch trình cụ thể.ởi Lào đang bình yên và đẹp lắm, nên mình muốn viết thật rõ ràng, trả lại cho Lào một bộ ảnh đẹp đẽ, bù đắp lại lần đầu phượt du lịch Lào 8 ngày 7 đêm chỉ hết 3,7tr style siêu bụi siêu nghèo ngày xưa. Bởi vì Lào xứng đáng, rất xứng đáng trở thành một chốn thanh tịnh, an yên ta có thể tìm đến vào một mùa thu mộng mơ như thế này.tối là Hí và Chó đã dắt díu nhau lên xe khách đi Lào luôn mà chẳng cần một lịch trình cụ thể.ởi Lào đang bình yên và đẹp lắm, nên mình muốn viết thật rõ ràng, trả lại cho Lào một bộ ảnh đẹp đẽ, bù đắp lại lần đầu phượt du lịch Lào 8 ngày 7 đêm chỉ hết 3,7tr style siêu bụi siêu nghèo ngày xưa. Bởi vì Lào xứng đáng, rất xứng đáng trở thành một chốn thanh tịtối là Hí và Chó đã dắt díu nhau lên xe khách đi Lào luôn mà chẳng cần một lịch trình cụ thể.ởi Lào đang bình yên và đẹp lắm, nên mình muốn viết thật rõ ràng, trả lại cho Lào một bộ ảnh đẹp đẽ, bù đắp lại lần đầu phượt du lịch Lào 8 ngày 7 đêm chỉ hết 3,7tr style siêu bụi siêu nghèo ngày xưa. Bởi vì Lào xứng đáng, rất xứng đáng trở thành một chốn thanh tị',
      author: 'Lê Diểm Trinh',
      imageUrl:
          'https://dulichchat.com/wp-content/uploads/2022/10/du-lich-lao-thai-lan-dulichchat-1-780x405.jpg',
      isFavorite: false,
    ),
    Post(
      id: 'p3',
      title:
          'ền hoà của Lào vẫn vương vất trong tiềm thức như một loại nước hoa lưu hương.Lào có lẽ là nước dễ đi nhất',
      content:
          'Trở lại nước bạn Lào anh em sau 4 năm xa cách, mọi thứ đều đã quá khác biệt. Ký ức cũng dần loãng ra bởi có quá nhiều chuyến đi khác lấp đầy, nhưng nét bình yên, nhịp sống chậm và sự hiền hoà của Lào vẫn vương vất trong tiềm thức như một loại nước hoa lưu hương.Lào có lẽ là nước dễ đi nhất, khi mà hôm trước Trang Hí mới nhắn bảo muốn đi đâu đó ăn mừng sinh nhật hai đứa thì hôm sau đã từ Đà Nẵng ra tới Hà Nội vào sáng tinh mơ, rồi chiều tối là Hí và Chó đã dắt díu nhau lên xe khách đi Lào luôn mà chẳng cần một lịch trình cụ thể.ởi Lào đang bình yên và đẹp lắm, nên mình muốn viết thật rõ ràng, trả lại cho Lào một bộ ảnh đẹp đẽ, bù đắp lại lần đầu phượt du lịch Lào 8 ngày 7 đêm chỉ hết 3,7tr style siêu bụi siêu nghèo ngày xưa. Bởi vì Lào xứng đáng, rất xứng đáng trở thành một chốn thanh tịnh, an yên ta có thể tìm đến vào một mùa thu mộng mơ như thế này.tối là Hí và Chó đã dắt díu nhau lên xe khách đi Lào luôn mà chẳng cần một lịch trình cụ thể.ởi Lào đang bình yên và đẹp lắm, nên mình muốn viết thật rõ ràng, trả lại cho Lào một bộ ảnh đẹp đẽ, bù đắp lại lần đầu phượt du lịch Lào 8 ngày 7 đêm chỉ hết 3,7tr style siêu bụi siêu nghèo ngày xưa. Bởi vì Lào xứng đáng, rất xứng đáng trở thành một chốn thanh tịtối là Hí và Chó đã dắt díu nhau lên xe khách đi Lào luôn mà chẳng cần một lịch trình cụ thể.ởi Lào đang bình yên và đẹp lắm, nên mình muốn viết thật rõ ràng, trả lại cho Lào một bộ ảnh đẹp đẽ, bù đắp lại lần đầu phượt du lịch Lào 8 ngày 7 đêm chỉ hết 3,7tr style siêu bụi siêu nghèo ngày xưa. Bởi vì Lào xứng đáng, rất xứng đáng trở thành một chốn thanh tị',
      author: 'Lê Diểm Trinh',
      imageUrl:
          'https://dulichchat.com/wp-content/uploads/2022/10/du-lich-lao-thai-lan-dulichchat-2.jpg',
      isFavorite: false,
    ),
  ];
  int get itemCount {
    return _items.length;
  }

  List<Post> get items {
    return [..._items];
  }

  List<Post> get favoriteItems {
    return _items.where((postItem) => postItem.isFavorite).toList();
  }
}
