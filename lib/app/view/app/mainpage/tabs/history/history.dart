import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/mainpage/tabs/history/pages/history.page.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/mainpage/tabs/history/pages/transaction.summary.page.dart';
import 'package:hubtel_coding_challenge_repo/app/widgets/app.custom.scroll.view.dart';
import 'package:hubtel_coding_challenge_repo/generated/l10n.dart';

import '../../../../../../utils/constants/dimens.dart';
import '../../../../../widgets/app.persistent.sliver.header.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final List<Tab> _tabs = [
    Tab(text: S.current.history),
    Tab(text: S.current.transaction_summary),
  ];

  final List<Widget> _children = [
    const HistoryPage(),
    const TransactionSummaryPage(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppCustomScrollView(
      hasScaffold: true,
      hasDefaultAppBarWithBack: false,
      slivers: [
        AppSliverPersistentHeader(
          min: sixtyDp,
          max: sixtyDp,
          child: AnimatedContainer(
            margin: EdgeInsets.only(left: tenDp.w, right: tenDp.w, top: 0.h, bottom: 3.h),
            padding: const EdgeInsets.all(eightDp),
            height: sixtyDp,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(eightDp),
            ),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,
            child: TabBar(
              controller: _tabController,
              //isScrollable: true,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(eightDp),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                    blurRadius: 0,
                  ),
                ],
              ),
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: fourteenDp.sp, fontWeight: FontWeight.w400),
              unselectedLabelStyle: TextStyle(
                fontSize: fourteenDp.sp,
              ),
              unselectedLabelColor: Colors.grey,
              tabs: _tabs,
            ),
          ),
        ),
        SliverFillRemaining(
          child: Container(),
        )
      ],
    );
  }
}
