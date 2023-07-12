import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubtel_coding_challenge_repo/core/view.helper/base.view.dart';
import 'package:hubtel_coding_challenge_repo/core/view.model/history.vm.dart';
import 'package:hubtel_coding_challenge_repo/generated/assets.gen.dart';
import 'package:hubtel_coding_challenge_repo/utils/constants/dimens.dart';
import 'package:hubtel_coding_challenge_repo/utils/constants/theme.colors.dart';
import 'package:hubtel_coding_challenge_repo/utils/enums.dart';
import 'package:hubtel_coding_challenge_repo/utils/widget.extensions.dart';

import '../../../../../../../core/models/history.model.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../../../widgets/history.item.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HistoryViewModel>(onModelReady: (vm) async {
      await vm.getHistory();
    }, builder: (context, vm, child) {
      return vm.getHistoryState.state == ModelState.loading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(ThemeColor.kFavoriteColor),
              ),
            )
          : Column(
              children: [
                twelveDp.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: fiftyDp,
                        child: TextFormField(
                          autofocus: false,
                          cursorColor: Colors.black,
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          inputFormatters: const [],
                          validator: (value) {},
                          onChanged: (value) {},
                          decoration: InputDecoration(
                              // contentPadding: const EdgeInsets.all(sixteenDp),
                              filled: true,
                              fillColor: ThemeColor.kGreyLight,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              hintText: S.current.search,
                              hintStyle: const TextStyle(color: ThemeColor.kGreyDeep),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 0, color: Colors.transparent),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(tenDp),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(width: 0, color: Colors.transparent),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(tenDp),
                                ),
                              ),
                              //  focusColor: ThemeColor.kFocusedColor,
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              )
                              // disabledBorder: InputBorder.none,
                              ),
                        ).horizontal(sixteenDp),
                      ),
                    ),
                    Assets.svg.filter.path.asSvg().right(sixteenDp)
                  ],
                ),
                twelveDp.verticalSpace,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(tenDp),
                          decoration: BoxDecoration(color: ThemeColor.kGreyLight, borderRadius: BorderRadius.circular(thirtyDp)),
                          child: Text(
                            'May 24, 2022',
                            style: TextStyle(color: ThemeColor.kGreyDeep, fontSize: tenDp.sp, fontWeight: FontWeight.w700),
                          ),
                        ).horizontal(sixteenDp),
                        ...listOfHistory.map((history) => HistoryItem(history: history)).toList(),
                        Container(
                          padding: const EdgeInsets.all(tenDp),
                          decoration: BoxDecoration(color: ThemeColor.kGreyLight, borderRadius: BorderRadius.circular(thirtyDp)),
                          child: Text(
                            'May 24, 2022',
                            style: TextStyle(color: ThemeColor.kGreyDeep, fontSize: tenDp.sp, fontWeight: FontWeight.w700),
                          ),
                        ).horizontal(sixteenDp),
                        ...listOfHistory.map((history) => HistoryItem(history: history)).toList()
                      ],
                    ),
                  ),
                ),
              ],
            );
    });
  }
}
