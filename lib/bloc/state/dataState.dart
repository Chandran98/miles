import 'package:equatable/equatable.dart';
import 'package:milesed/model/homedataModel.dart';
import 'package:milesed/model/testimonialModel.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}


class HomeDataInit extends DataState {}

class HomeDataloading extends DataState {}

class HomeDataloaded extends DataState {
  final HomeDataModel data;
  const HomeDataloaded({required this.data});

  @override
  get props => [data];
}
class HomeDataError extends DataState {
  final String err;
  const HomeDataError({required this.err});
}



class TestimonialDataInit extends DataState {}

class TestimonialDataloading extends DataState {}

class TestimonialDataloaded extends DataState {
  final TestimonialsModal data;
  const TestimonialDataloaded({required this.data});

  @override
  get props => [data];
}
class TestimonialDataError extends DataState {
  final String err;
  const TestimonialDataError({required this.err});
}
