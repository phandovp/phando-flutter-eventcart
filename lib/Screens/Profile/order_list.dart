import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' hide log;

import '../../Models/order_list_model.dart';
import '../../Services/api_manager.dart';
import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import '../Home Screen/home.dart';

// ignore: must_be_immutable
class OrderList extends StatefulWidget {
  OrderList({Key? key, required this.page}) : super(key: key);
  int page;

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<String> orderStatus = [
    'All Order',
    'Confirmed',
    'Canceled',
    'Shipped',
    'Delivered'
  ];
  int selectedIndex = 0;
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String token = '';
  bool isLoading = false;

  Future<void> getToken() async {
    SharedPreferences preferences = await _prefs;
    setState(() {
      token = preferences.getString('token')!;
    });
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'My Orders',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            FutureBuilder<OrderListModel>(
                future: _apiManager.orderList(token, widget.page),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.value!.data!.isNotEmpty) {
                      return Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  snapshot.data?.value?.data?.length ?? 0,
                              itemBuilder: (BuildContext context, index) {
                                return ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        snapshot.data?.value?.data?.length ?? 1,
                                    itemBuilder: (_, i) {
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ListTile(
                                            leading: Image.network(
                                              snapshot
                                                      .data
                                                      ?.value
                                                      ?.data?[index]
                                                      .product
                                                      ?.images?[0]
                                                      .imageUrl ??
                                                  '',
                                              cacheHeight: 200,
                                              cacheWidth: 200,
                                            ),
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot
                                                          .data
                                                          ?.value
                                                          ?.data?[index]
                                                          .product
                                                          ?.name ??
                                                      '',
                                                  style: kTextStyle.copyWith(
                                                      color: kTitleColor),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '#${snapshot.data?.value?.data?[index].orderId ?? 'order Id'}',
                                                      style: kTextStyle.copyWith(
                                                          color:
                                                              kGreyTextColor),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      '$currencyIcon ${snapshot.data?.value?.data?[index].grandTotal ?? 'Sale Price'}',
                                                      style:
                                                          kTextStyle.copyWith(
                                                        color: kMainColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                top: 5,
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                      4.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: kBgColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: Text(
                                                      'x${snapshot.data?.value?.data?[index].qty ?? 'quantity'}',
                                                      style:
                                                          kTextStyle.copyWith(
                                                        color: kRedColor,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    DateFormat.yMMMd().format(
                                                      DateTime.parse(
                                                        snapshot
                                                                .data
                                                                ?.value
                                                                ?.data?[index]
                                                                .createdAt ??
                                                            DateTime.now()
                                                                .toIso8601String(),
                                                      ),
                                                    ),
                                                    style: kTextStyle.copyWith(
                                                        color: kGreyTextColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                      // .onTap(
                                      //   () => DeliveryStatus(
                                      //     details: snapshot.data!.value!
                                      //         .data![index].details![i],
                                      //     orderId: snapshot
                                      //         .data!.value!.data![index].id
                                      //         .toString(),
                                      //   ).launch(context),
                                      // );
                                    });
                              }),
                          GestureDetector(
                            onTap: () {
                              int page = widget.page + 1;
                              OrderList(page: page).launch(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'See Previous Orders',
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ).visible(
                                snapshot.data!.value!.lastPage != widget.page,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'images/emptycart.svg',
                            height: context.height() / 2,
                            width: context.width(),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'You Haven\'t ordered any items yet',
                            style: kTextStyle.copyWith(
                                color: kTitleColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ButtonGlobal(
                              buttontext: 'Shop Now',
                              buttonDecoration:
                                  kButtonDecoration.copyWith(color: kMainColor),
                              onPressed: () => const Home().launch(context)),
                        ],
                      );
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
