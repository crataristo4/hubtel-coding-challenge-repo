import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/mainpage/tabs/history/pages/history.page.dart';
import 'package:hubtel_coding_challenge_repo/app/view/app/mainpage/tabs/history/pages/transaction.summary.page.dart';
import 'package:hubtel_coding_challenge_repo/app/widgets/app.custom.scroll.view.dart';
import 'package:hubtel_coding_challenge_repo/generated/l10n.dart';
import 'package:hubtel_coding_challenge_repo/utils/constants/theme.colors.dart';
import 'package:hubtel_coding_challenge_repo/utils/widget.extensions.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingAction: Container(
        decoration: BoxDecoration(color: ThemeColor.kSendNewColor, borderRadius: BorderRadius.circular(sixDp)),
        child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            label: Text(
              S.current.send_new.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            )),
      ),
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        const SliverPadding(padding: EdgeInsets.symmetric(vertical: twentyDp)),
        /*  AppSliverAppBar(
          forcedElevated: true,
          title: AnimatedContainer(
            // margin: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.h),
            padding: const EdgeInsets.all(eightDp),
            height: sixtyDp,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(eightDp),
            ),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,
            child: TabBar(
              controller: _tabController,
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
              labelStyle: TextStyle(fontSize: twelveDp.sp, fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(
                fontSize: twelveDp.sp,
              ),
              unselectedLabelColor: Colors.grey,
              tabs: _tabs,
            ),
          ).bottom(sixDp),
        ),*/
        AppSliverPersistentHeader(
          min: seventyDp,
          max: seventyDp,
          child: Container(
            margin: const EdgeInsets.only(top: tenDp, left: sixteenDp, right: sixteenDp),
            child: AnimatedContainer(
              // margin: EdgeInsets.only(left: 0.w, right: 0.w, top: 0.h),
              padding: const EdgeInsets.all(eightDp),
              height: seventyDp,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(eightDp),
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInBack,
              child: TabBar(
                controller: _tabController,
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
                labelStyle: TextStyle(fontSize: twelveDp.sp, fontWeight: FontWeight.w600),
                unselectedLabelStyle: TextStyle(
                  fontSize: twelveDp.sp,
                ),
                unselectedLabelColor: Colors.grey,
                tabs: _tabs,
              ),
            ).bottom(sixDp),
          ),
        ),
        SliverFillRemaining(
          child: Column(
            children: [
              const Divider(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: _children,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
