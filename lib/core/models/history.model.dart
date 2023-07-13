import 'package:hubtel_coding_challenge_repo/utils/enums.dart';

class HistoryModel {
  final String providerImage;
  final String name;
  final String number;
  final num amount;
  final TransactionType transactionType;
  final bool isFavorite;
  final TransactionStatus transactionStatus;

  HistoryModel({
    required this.providerImage,
    required this.name,
    required this.number,
    required this.amount,
    required this.transactionType,
    required this.isFavorite,
    required this.transactionStatus,
  });
}

List<HistoryModel> _listOfHistory = [
  HistoryModel(
      providerImage: '',
      name: 'Emmanuel Rockson Kwabena Uncle Ebo',
      number: '024 123 4567',
      amount: 500,
      transactionType: TransactionType.personal,
      isFavorite: true,
      transactionStatus: TransactionStatus.success),
];
