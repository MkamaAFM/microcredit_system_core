import 'package:microcredit_system_core/objects/client/client.dart';
import '../data_object.dart';
import '../fee.dart';
import '../payment.dart';
import 'bond.dart';
import 'installment.dart';
import 'loan_approve.dart';
import 'loan_disbursement.dart';

class LoanProduct extends DataObject {
  final Client client;
  final DateTime createdDate;
  final LoanDisbursement loanDisbursement;
  final int numberOfInstallments, daysBetweenInstallment;
  final double amount, interestRateInPercentage;
  final InterestRateType interestRateType;
  final List<LoanApprove> approves;
  final List<Payment> payments;
  final List<Bond> bonds;
  final List<Fee> fees;

  LoanProduct(
      String id,
      String oid,
      this.client,
      this.createdDate,
      this.loanDisbursement,
      this.numberOfInstallments,
      this.daysBetweenInstallment,
      this.amount,
      this.interestRateInPercentage,
      this.interestRateType,
      this.approves,
      this.payments,
      this.fees,
      this.bonds)
      : super(id, oid);

  List<Installment> get installments => [];

  List<Payment> get allPayments {
    final list = <Payment>[...payments];
    for (final fee in fees) {
      list.addAll(fee.payments);
    }
    return list;
  }

  double get totalAmount {
    //TODO: add interest, other fees
    double total = amount;
    for (final fee in fees) {
      total = total + fee.amount;
    }
    return total;
  }

  double get totalPaid {
    //TODO: add fee installmentsPayments
    double total = 0;
    for (final payment in allPayments) {
      total = total + payment.amount;
    }
    return total;
  }

  bool get cleared => balance <= 0;

  bool get approved {
    //TODO: using organization settings, compare number of approves
    return (approves.where((element) => element.approve).length > 1) &&
        !dissaproved;
  }

  bool get pendingApproval => !approved && !dissaproved;

  bool get dissaproved {
    //TODO: using organization settings, compare number of approves
    return approves.where((element) => !element.approve).length > 1;
  }

  double get balance => totalAmount - totalPaid;

  @override
  Map<String, Object> get map => {
        ...super.map,
        'client_id': client.id,
        'created_date': createdDate,
        'disbursement_id': loanDisbursement.id,
        'number_of_installments': numberOfInstallments,
        'days_btn_installments': daysBetweenInstallment,
        'amount': amount,
        'interest_rate': interestRateInPercentage,
        'approves_id': [for (final approve in approves) approve.id],
        'payments_id': [for (final payment in payments) payment.id],
        'fees_id': [for (final fee in fees) fee.id],
        'interest_rate_type': interestRateType.toString()
      };
}

enum InterestRateType { fixedInterest, reducingBalance }
