import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubtel_coding_challenge_repo/app/widgets/animated.column.dart';
import 'package:hubtel_coding_challenge_repo/app/widgets/bordered.container.dart';
import 'package:hubtel_coding_challenge_repo/core/models/history.model.dart';
import 'package:hubtel_coding_challenge_repo/generated/l10n.dart';
import 'package:hubtel_coding_challenge_repo/utils/constants/dimens.dart';
import 'package:hubtel_coding_challenge_repo/utils/constants/theme.colors.dart';
import 'package:hubtel_coding_challenge_repo/utils/enums.dart';
import 'package:hubtel_coding_challenge_repo/utils/widget.extensions.dart';

import '../../generated/assets.gen.dart';

class HistoryItem extends StatefulWidget {
  final HistoryModel history;
  const HistoryItem({Key? key, required this.history}) : super(key: key);

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  late HistoryModel history = widget.history;
  @override
  Widget build(BuildContext context) {
    final statusIcon =
        history.transactionStatus == TransactionStatus.Successful ? Assets.svg.success.path : Assets.svg.failed.path;
    return BorderedContainer(
        containerMargin: const EdgeInsets.all(sixteenDp),
        child: AnimatedColumnWidget(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            history.time,
            style: const TextStyle(color: ThemeColor.kGreyDeep),
          ),
          sixteenDp.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    history.providerImage.asAssetImage(fit: BoxFit.cover, width: fortyDp, height: fortyDp),
                    tenDp.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  history.name,
                                  maxLines: 2,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(tenDp),
                                decoration: BoxDecoration(
                                    color: history.transactionStatus == TransactionStatus.Successful
                                        ? ThemeColor.kLightGreen
                                        : ThemeColor.kFailureBgColor,
                                    borderRadius: BorderRadius.circular(thirtyDp)),
                                child: Row(
                                  children: [
                                    statusIcon.toString().asSvg(width: sixteenDp, height: sixteenDp),
                                    fourDp.horizontalSpace,
                                    Text(
                                      history.transactionStatus.name,
                                      style: TextStyle(
                                          color: history.transactionStatus == TransactionStatus.Successful
                                              ? ThemeColor.kSuccessTextColor
                                              : ThemeColor.kFailureTextColor,
                                          fontSize: tenDp.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          sixteenDp.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                history.number,
                                style: const TextStyle(color: ThemeColor.kGreyDeep),
                              ),
                              Text(
                                '${S.current.gh_currency} ${history.amount}',
                                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          tenDp.verticalSpace,
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          sixteenDp.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Assets.images.person.path.asAssetImage(size: thirtyDp),
                    tenDp.horizontalSpace,
                    Text(history.transactionType.name, style: TextStyle(fontSize: twelveDp.sp)),
                    tenDp.horizontalSpace,
                    Container(
                      width: sixDp,
                      height: sixDp,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeColor.kGreyDeep,
                      ),
                    ),
                    tenDp.horizontalSpace,
                    Text(
                      history.transactionDescription,
                      style: TextStyle(fontSize: twelveDp.sp),
                    ),
                  ],
                ),
              ),
              if (history.isFavorite)
                const Icon(
                  Icons.star,
                  color: ThemeColor.kFavoriteColor,
                )
            ],
          ),
          sixteenDp.verticalSpace,
        ]));
  }
}
