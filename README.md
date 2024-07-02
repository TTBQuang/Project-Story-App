# Project-Story-App

## Mô tả
Đây là đồ án cuối kỳ của môn học Thiết kế phần mềm của trường Đại học Khoa học tự nhiên

## Chức năng
Nhóm sinh viên xây dựng 01 phần mềm đáp ứng các nhu cầu cơ bản sau:
- Người sử dụng tìm kiếm truyện tiểu thuyết theo mong muốn, có thể tìm theo tên, theo tác giả, theo năm xuất bản, …
- Người sử dụng chọn tiểu thuyết để đọc.
- Trong quá trình đọc, người sử dụng có thể điều chỉnh các thành thành phần hiển thị trên khung đọc truyện (vd: thay đổi kích cỡ chữ, font chữ, màu sắc nền, màu sắc chữ, độ giãn cách dòng, …).
- Ngoài ra, ứng dụng cũng hỗ trợ người sử dụng lưu trữ trạng thái các tiểu thuyết đang đọc, đồng thời hỗ trợ người sử dụng di chuyển nhanh đến từng chương, hồi, trang truyện cụ thể để tiếp tục theo dõi.
- Người sử dụng có thể xuất các đầu truyện đang đọc sang dạng tập tin ebook (prc, epub, pdf, …) để có thể dễ dàng theo dõi tiếp tục trên các thiết bị chuyên dụng.

## Các yêu cầu đặc biệt
- Hệ thống không có sẵn và cũng không muốn lưu trữ nội dung các tiểu thuyết, các thông tin về truyện sẽ được hệ thống lấy về từ các website đọc tiểu thuyết trực tuyến khác (https://truyenfull.vn/, https://truyen.tangthuvien.vn/, …)
- Các nguồn tải truyện có thể được loại bỏ hoặc bổ sung trong quá trình vận hành ứng dụng. Việc điều chỉnh các nguồn này sẽ được quyết định bởi bộ phận quản trị và vận hành ứng dụng.
- Thông tin tiểu thuyết được lấy về từ các nguồn có thể tuân theo một thứ tự ưu tiên do người sử dụng quyết định. Mỗi người sử dụng có thể khai báo thứ tự ưu tiên của các nguồn truyện khác nhau, tuỳ theo sở thích.
- Từng chương/hồi của tiểu thuyết có thể được lấy từ các nguồn khác nhau, không nhất thiết phải từ một nguồn, nhằm đảm bảo quá trình theo dõi được diễn ra trôi chảy.
  - Chương 3 truyện X ở nguồn #1 có chất lượng không tốt, người sử dụng có thể chọn sử dụng kết quả từ nguồn #2 để theo dõi tiếp tục.
  - Chương 4 truyện Y nguồn #1 không khả dụng, hệ thống tự động sử dụng kết quả từ nguồn #2.
- Nội dung tiểu thuyết được người sử dụng đọc có thể được tải về và lưu trữ cục bộ tại máy tính của người sử dụng để quá trình theo dõi được diễn ra nhanh chóng và thuận tiện.
- Các định dạng tập tin mà ứng dụng hỗ trợ xuất có thể được bổ sung và loại bỏ trong quá trình vận hành.
- Quá trình bổ sung / loại bỏ nguồn tiểu thuyết và định dạng tập tin lưu nên được thiết kế và thực hiện theo một trong các cấp độ dưới đây:
  - Cấp độ 1: không cần biên dịch lại mã nguồn của hệ thống đang vận hành, nguồn tiểu thuyết mới và định dạng tập tin hỗ trợ mới sẽ được gắn nóng vào hệ thống (hot plug), hệ thống tự nhận dạng các thay đổi này ngay lập tức.
  - Cấp độ 2: các thay đổi được đưa vào hệ thống đang có mà không yêu cầu chỉnh sửa mã nguồn của các thành phần đang hoạt động ổn định (tức là chỉ thêm class/file, không sửa class/file), hệ thống cần được biên dịch và triển khai lại.
  - Cấp độ 3: các thay đổi được đưa vào hệ thống bằng cách chỉnh sửa hoặc thay thế các tập tin mã nguồn hiện có. Phương án này là phương án tồi-tệ nhất, thể hiện thiết kế hệ thống có khả năng mở rộng kém.
