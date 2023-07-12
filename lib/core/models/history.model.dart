import 'package:hubtel_coding_challenge_repo/generated/assets.gen.dart';
import 'package:hubtel_coding_challenge_repo/utils/enums.dart';

class HistoryModel {
  final String providerImage;
  final String name;
  final String number;
  final num amount;
  final TransactionType transactionType;
  final bool isFavorite;
  final TransactionStatus transactionStatus;
  final String time;
  final String transactionDescription;

  HistoryModel(
      {required this.providerImage,
      required this.name,
      required this.number,
      required this.amount,
      required this.transactionType,
      required this.isFavorite,
      required this.transactionStatus,
      required this.time,
      required this.transactionDescription});
}

List<HistoryModel> _listOfHistory = [
  HistoryModel(
    providerImage: Assets.images.mtn.path,
    time: '14:45 PM',
    name: 'Emmanuel Rockson Kwabena Uncle Ebo ',
    number: '024 123 4567',
    amount: 500,
    transactionType: TransactionType.Personal,
    isFavorite: true,
    transactionStatus: TransactionStatus.Successful,
    transactionDescription: 'Cool your heart wai',
  ),
  HistoryModel(
      providerImage: Assets.images.absa.path,
      time: '14:45 PM',
      name: 'Absa',
      number: '024 123 4567',
      amount: 500,
      transactionType: TransactionType.Personal,
      isFavorite: false,
      transactionStatus: TransactionStatus.Failed,
      transactionDescription: 'Cool your heart wai'),
  HistoryModel(
      providerImage: Assets.images.mtn.path,
      time: '14:45 PM',
      name: 'Emmanuel Rockson ',
      number: '024 123 4567',
      amount: 500,
      transactionType: TransactionType.Personal,
      isFavorite: false,
      transactionStatus: TransactionStatus.Successful,
      transactionDescription: 'Cool your heart wai'),
  HistoryModel(
      providerImage: Assets.images.absa.path,
      time: '14:45 PM',
      name: 'Absa',
      number: '024 123 4567',
      amount: 500,
      transactionType: TransactionType.Personal,
      isFavorite: false,
      transactionStatus: TransactionStatus.Failed,
      transactionDescription: 'Cool your heart wai'),
];

List<HistoryModel> get listOfHistory => _listOfHistory;
