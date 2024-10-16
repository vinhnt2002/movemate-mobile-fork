import 'package:flutter/material.dart';
import 'package:movemate/features/booking/presentation/providers/booking_provider.dart';

// Import ImageData class
import 'package:movemate/features/booking/domain/entities/image_data.dart';

import 'room_image.dart';
import 'add_image_button.dart';

class RoomImageSection extends StatelessWidget {
  final String roomTitle;
  final List<ImageData> images;
  final RoomType roomType;
  final BookingNotifier bookingNotifier;

  const RoomImageSection({
    super.key,
    required this.roomTitle,
    required this.images,
    required this.roomType,
    required this.bookingNotifier,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasImages = images.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          roomTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length + 1,
            itemBuilder: (context, index) {
              if (index == images.length) {
                return AddImageButton(
                  roomType: roomType,
                  bookingNotifier: bookingNotifier,
                  hasImages: hasImages,
                );
              } else {
                return RoomImage(
                  imageData: images[index],
                  roomType: roomType,
                  bookingNotifier: bookingNotifier,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
