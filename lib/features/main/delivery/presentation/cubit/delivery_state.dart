// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'delivery_cubit.dart';

enum DeliveryStateStatus {
  initial,
  loading,
  loaded,
  failed,
  mapCreated,
  requested,
}

enum DeliveryType { pickup, dropoff }

class DeliveryState extends Equatable {
  const DeliveryState({
    this.merchants,
    required this.status,
    this.deliveryData,
    this.failure,
    this.pickUpRequest,
    this.dropOffRequest,
  });

  final List<MerchantModel?>? merchants;
  final PickUpRequest? pickUpRequest;
  final DropOffRequest? dropOffRequest;
  final DeliveryData? deliveryData;
  final DeliveryStateStatus status;
  final Failure? failure;

  @override
  List<Object?> get props =>
      [merchants, status, failure, pickUpRequest, deliveryData, dropOffRequest];

  DeliveryState copyWith({
    List<MerchantModel?>? merchants,
    PickUpRequest? pickUpRequest,
    DeliveryData? deliveryData,
    DropOffRequest? dropOffRequest,
    DeliveryStateStatus? status,
    Failure? failure,
  }) {
    return DeliveryState(
      merchants: merchants ?? this.merchants,
      status: status ?? this.status,
      deliveryData: deliveryData ?? this.deliveryData,
      failure: failure ?? this.failure,
      dropOffRequest: dropOffRequest ?? this.dropOffRequest,
      pickUpRequest: pickUpRequest ?? this.pickUpRequest,
    );
  }
}
