import 'package:flutter/material.dart';
import 'package:travo_app_source/core/helpers/asset_helper.dart';
import 'package:travo_app_source/representation/widgets/app_bar_container.dart';
import 'package:travo_app_source/representation/widgets/item_change_guest_and_room.dart';

import '../../core/constants/dimension_constants.dart';
import '../widgets/item_button_widget.dart';

class GuestAndRoomScreen extends StatefulWidget {
  const GuestAndRoomScreen({Key? key}) : super(key: key);

  static const String routeName = '/guest_and_room_screen';

  @override
  State<GuestAndRoomScreen> createState() => _GuestAndRoomScreenState();
}

class _GuestAndRoomScreenState extends State<GuestAndRoomScreen> {
  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountGuest = GlobalKey<ItemChangeGuestAndRoomState>();
  final GlobalKey<ItemChangeGuestAndRoomState> _itemCountRoom = GlobalKey<ItemChangeGuestAndRoomState>();

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: 'Add guest and room',
      paddingContent: EdgeInsets.all(kMediumPadding),
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding,
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountGuest,
            initData: 1,
            icon: AssetHelper.icoGuest,
            value: 'Guest',
          ),
          ItemChangeGuestAndRoom(
            key: _itemCountRoom,
            initData: 1,
            icon: AssetHelper.icoRoom,
            value: 'Room',
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ItemButtonWidget(
            data: 'Done',
            onTap: () {
              Navigator.of(context).pop([
                _itemCountGuest.currentState!.number,
                _itemCountRoom.currentState!.number,
              ]);
            },
          ),
        ],
      ),
    );
  }
}
