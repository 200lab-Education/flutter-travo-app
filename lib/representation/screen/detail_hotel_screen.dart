import 'package:flutter/material.dart';
import 'package:travo_app_source/core/helpers/asset_helper.dart';
import 'package:travo_app_source/core/helpers/image_helper.dart';
import 'package:travo_app_source/data/model/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travo_app_source/representation/screen/rooms_screen.dart';
import 'package:travo_app_source/representation/widgets/dash_line.dart';
import 'package:travo_app_source/representation/widgets/item_button_widget.dart';

import '../../core/constants/dimension_constants.dart';
import '../../core/constants/textstyle_ext.dart';
import '../widgets/item_utility_hotel.dart';

class DetailHotelScreen extends StatefulWidget {
  static const String routeName = '/detail_hotel_screen';

  const DetailHotelScreen({
    Key? key,
    required this.hotelModel,
  }) : super(key: key);

  final HotelModel hotelModel;

  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.hotelScreen,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding,
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(kItemPadding),
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: kDefaultPadding,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding,
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(kItemPadding),
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  size: kDefaultPadding,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kItemPadding),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kMediumPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.hotelModel.hotelName,
                                    style: TextStyles.defaultStyle.fontHeader.bold,
                                  ),
                                  Spacer(),
                                  Text(
                                    '\$${widget.hotelModel.price.toString()}',
                                    style: TextStyles.defaultStyle.fontHeader.bold,
                                  ),
                                  Text(
                                    ' /night',
                                    style: TextStyles.defaultStyle.fontCaption,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              Row(
                                children: [
                                  ImageHelper.loadFromAsset(
                                    AssetHelper.icoLocationBlank,
                                  ),
                                  SizedBox(
                                    width: kMinPadding,
                                  ),
                                  Text(
                                    widget.hotelModel.location,
                                  ),
                                  Text(
                                    ' - ${widget.hotelModel.awayKilometer} from destination',
                                    style: TextStyles.defaultStyle.subTitleTextColor.fontCaption,
                                  ),
                                ],
                              ),
                              DashLineWidget(),
                              Row(
                                children: [
                                  ImageHelper.loadFromAsset(
                                    AssetHelper.icoStar,
                                  ),
                                  SizedBox(
                                    width: kMinPadding,
                                  ),
                                  Text(
                                    widget.hotelModel.star.toString(),
                                  ),
                                  Text(
                                    ' (${widget.hotelModel.numberOfReview} reviews)',
                                    style: TextStyles.defaultStyle.subTitleTextColor,
                                  ),
                                  Spacer(),
                                  Text(
                                    'See All',
                                    style: TextStyles.defaultStyle.bold.primaryTextColor,
                                  ),
                                ],
                              ),
                              DashLineWidget(),
                              Text(
                                'Infomation',
                                style: TextStyles.defaultStyle.bold,
                              ),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              Text(
                                '''You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.''',
                              ),
                              ItemUtilityHotelWidget(),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              Text(
                                'Location',
                                style: TextStyles.defaultStyle.bold,
                              ),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              Text(
                                '''Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.''',
                              ),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              ImageHelper.loadFromAsset(
                                AssetHelper.imageMap,
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: kMediumPadding,
                              ),
                              ItemButtonWidget(
                                  data: 'Select Room',
                                  onTap: () {
                                    Navigator.of(context).pushNamed(RoomsScreen.routeName);
                                  }),
                              SizedBox(
                                height: kMediumPadding,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * 0.7,
          //     padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(kDefaultPadding * 2),
          //         topRight: Radius.circular(kDefaultPadding * 2),
          //       ),
          //     ),
          //     child: Column(
          //       children: [
          //         Container(
          //           alignment: Alignment.center,
          //           margin: EdgeInsets.only(top: kDefaultPadding),
          //           child: Container(
          //             height: 5,
          //             width: 60,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(kItemPadding),
          //               color: Colors.black,
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           height: kMediumPadding,
          //         ),
          //         Expanded(
          //           child: SingleChildScrollView(
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Row(
          //                   children: [
          //                     Text(
          //                       widget.hotelModel.hotelName,
          //                       style: TextStyles.defaultStyle.fontHeader.bold,
          //                     ),
          //                     Spacer(),
          //                     Text(
          //                       '\$${widget.hotelModel.price.toString()}',
          //                       style: TextStyles.defaultStyle.fontHeader.bold,
          //                     ),
          //                     Text(
          //                       ' /night',
          //                       style: TextStyles.defaultStyle.fontCaption,
          //                     ),
          //                   ],
          //                 ),
          //                 SizedBox(
          //                   height: kDefaultPadding,
          //                 ),
          //                 Row(
          //                   children: [
          //                     ImageHelper.loadFromAsset(
          //                       AssetHelper.icoLocationBlank,
          //                     ),
          //                     SizedBox(
          //                       width: kMinPadding,
          //                     ),
          //                     Text(
          //                       widget.hotelModel.location,
          //                     ),
          //                     Text(
          //                       ' - ${widget.hotelModel.awayKilometer} from destination',
          //                       style: TextStyles.defaultStyle.subTitleTextColor.fontCaption,
          //                     ),
          //                   ],
          //                 ),
          //                 DashLineWidget(),
          //                 Row(
          //                   children: [
          //                     ImageHelper.loadFromAsset(
          //                       AssetHelper.icoStar,
          //                     ),
          //                     SizedBox(
          //                       width: kMinPadding,
          //                     ),
          //                     Text(
          //                       widget.hotelModel.star.toString(),
          //                     ),
          //                     Text(
          //                       ' (${widget.hotelModel.numberOfReview} reviews)',
          //                       style: TextStyles.defaultStyle.subTitleTextColor,
          //                     ),
          //                     Spacer(),
          //                     Text(
          //                       'See All',
          //                       style: TextStyles.defaultStyle.bold.primaryTextColor,
          //                     ),
          //                   ],
          //                 ),
          //                 DashLineWidget(),
          //                 Text(
          //                   'Infomation',
          //                   style: TextStyles.defaultStyle.bold,
          //                 ),
          //                 SizedBox(
          //                   height: kDefaultPadding,
          //                 ),
          //                 Text(
          //                   '''You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.''',
          //                 ),
          //                 ItemUtilityHotelWidget(),
          //                 SizedBox(
          //                   height: kDefaultPadding,
          //                 ),
          //                 Text(
          //                   'Location',
          //                   style: TextStyles.defaultStyle.bold,
          //                 ),
          //                 SizedBox(
          //                   height: kDefaultPadding,
          //                 ),
          //                 Text(
          //                   '''Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.''',
          //                 ),
          //                 SizedBox(
          //                   height: kDefaultPadding,
          //                 ),
          //                 ImageHelper.loadFromAsset(
          //                   AssetHelper.imageMap,
          //                   width: double.infinity,
          //                 ),
          //                 SizedBox(
          //                   height: kMediumPadding,
          //                 ),
          //                 ItemButtonWidget(
          //                     data: 'Select Room',
          //                     onTap: () {
          //                       Navigator.of(context).pushNamed(RoomsScreen.routeName);
          //                     }),
          //                 SizedBox(
          //                   height: kMediumPadding,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
