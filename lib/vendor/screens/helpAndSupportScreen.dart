import 'package:SnipSnap/vendor/models/businessLayer/baseRoute.dart';
import 'package:SnipSnap/vendor/models/faqModel.dart';
import 'package:flutter/material.dart';
import 'package:SnipSnap/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

class HelpAndSupportScreen extends BaseRoute {
  HelpAndSupportScreen({a, o}) : super(a: a, o: o, r: 'HelpAndSupportScreen');
  @override
  _HelpAndSupportScreenState createState() => new _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends BaseRouteState {
  GlobalKey<ScaffoldState> _scaffoldKey;
  List<Faqs> _faqList = [];
  bool _isDataLoaded = false;
  _HelpAndSupportScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return sc(
      WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
          return null;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).primaryColor,
                            BlendMode.screen,
                          ),
                          child: Image.asset(
                            'assets/banner.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, left: 10, top: 15),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_left_outlined,
                                color: Colors.black,
                              ),
                              Text(
                                L10n.of(context).lbl_back,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17.5),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    margin: EdgeInsets.only(top: 80),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 30, bottom: 10),
                              child: Text(
                                L10n.of(context).lbl_help_and_support,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline3,
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height - 181,
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          L10n.of(context).lbl_faq,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  _isDataLoaded
                                      ? _faqList.length > 0
                                          ? Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height -
                                                  181,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: _faqList.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Card(
                                                      margin: EdgeInsets.only(
                                                          bottom: 8),
                                                      elevation: 2,
                                                      child: ExpansionTile(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                '${_faqList[index].answer}',
                                                                style: Theme.of(
                                                                        context)
                                                                    .primaryTextTheme
                                                                    .subtitle1,
                                                              ),
                                                            )
                                                          ],
                                                          title: Text(
                                                            '${index + 1}. ${_faqList[index].question}',
                                                          )),
                                                    );
                                                  }),
                                            )
                                          : Center(
                                              child: Text(L10n.of(context)
                                                  .txt_faq_will_shown_here),
                                            )
                                      : _shimmer()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  getFaqs() async {
    try {
      bool isConnected = await br.checkConnectivity();
      if (isConnected) {
        await apiHelper.getFaqs().then((result) {
          if (result != null) {
            if (result.status == "1") {
              _faqList = result.recordList as List<Faqs>;
            } else {
              _faqList = [];
            }
          }
        });
      } else {
        showNetworkErrorSnackBar(_scaffoldKey);
      }
    } catch (e) {
      print("Exception - helpAndSupportScreen.dart - _getFaqss():" +
          e.toString());
    }
  }

  init() async {
    try {
      await getFaqs();
      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - helpAndSupportScreen.dart - init():" + e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Widget _shimmer() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 60,
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Card());
            }),
      ),
    );
  }
}
