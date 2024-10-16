import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movemate/features/booking/presentation/widgets/booking_screen_2th/price_detail_modal.dart';
import 'package:movemate/utils/commons/widgets/widgets_common_export.dart';

@RoutePage()
class ReviewOnline extends StatelessWidget {
  const ReviewOnline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Gợi ý dịch vụ',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chọn xe không hợp lý',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Chúng tôi đề xuất cho bạn như sau',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              buildServiceCard(),
              const SizedBox(height: 16),
              buildContactCard(),
              const SizedBox(height: 24),
              // Loại bỏ hai nút khỏi đây
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildButton(
                'Xác nhận',
                Colors.orange,
                onPressed: () => showPriceDetailModal(context),
              ),
              const SizedBox(height: 12),
              buildButton(
                'Hủy',
                Colors.white,
                textColor: Colors.grey,
                borderColor: Colors.grey,
                onPressed: () => context.router.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPriceDetailModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return const PriceDetailModal();
      },
    );
  }

  Widget buildServiceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                'https://img.lovepik.com/png/20231013/Cartoon-blue-logistics-transport-truck-package-consumption-driver_196743_wh860.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Xe Tải 1250 kg',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('4m dài, 1m8 rộng, 1m8 cao',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('BOG xếp: (Bốc nhân viên bốc xếp)',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text('4 người', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          const Text('Bốc xếp ngoài giờ: (Khi nhân viên bốc xếp)',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const Text('476.000đ/giờ', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget buildContactCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://img.lovepik.com/free-png/20211130/lovepik-cartoon-avatar-png-image_401205251_wh1200.png'),
            radius: 25,
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Liên hệ với nhân viên',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Vũ Văn Thiện', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.phone, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget buildButton(
    String text,
    Color color, {
    Color textColor = Colors.white,
    Color? borderColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          side: borderColor != null ? BorderSide(color: borderColor) : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
