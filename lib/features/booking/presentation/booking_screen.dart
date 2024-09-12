import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:movemate/configs/routes/app_router.dart';
import 'package:movemate/features/booking/data/data_sources/booking_shared_preferences.dart';
import 'package:movemate/utils/constants/asset_constant.dart';
import 'package:movemate/features/booking/presentation/booking_details.dart';
import 'package:movemate/utils/commons/widgets/booking_layout/widget/booking_selection.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class BookingScreen extends HookWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final houseType = useState<String?>(null);
    final numberOfRooms = useState<int>(1);
    final numberOfFloors = useState<int>(1);

    useEffect(() {
      Future<void> loadState() async {
        houseType.value = await BookingSharedPreferences.getHouseType();
        numberOfRooms.value = await BookingSharedPreferences.getNumberOfRooms();
        numberOfFloors.value =
            await BookingSharedPreferences.getNumberOfFloors();
      }

      loadState();
      return null; // Clean-up function, not needed here
    }, []);

    void _saveState() async {
      await BookingSharedPreferences.setHouseType(houseType.value);
      await BookingSharedPreferences.setNumberOfRooms(numberOfRooms.value);
      await BookingSharedPreferences.setNumberOfFloors(numberOfFloors.value);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thông tin đặt hàng',
          style: TextStyle(
            color: AssetsConstants.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AssetsConstants.mainColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookingSelection(
                onHouseTypeSelected: (selectedType) {
                  houseType.value = selectedType;
                  _saveState();
                },
                onRoomCountSelected: (count) {
                  numberOfRooms.value = count;
                  _saveState();
                },
                onFloorCountSelected: (count) {
                  numberOfFloors.value = count;
                  _saveState();
                },
              ),
              const SizedBox(height: 16),
              BookingDetails(
                houseType: houseType.value,
                numberOfRooms: numberOfRooms.value,
                numberOfFloors: numberOfFloors.value,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AssetsConstants.primaryLight,
                  ),
                  onPressed: () {
                    context.router.push(AvailableVehiclesScreenRoute());
                  },
                  child: const Text('Tiếp tục',
                      style: TextStyle(
                          fontSize: 16, color: AssetsConstants.whiteColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
