import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milesed/bloc/event/dataEvent.dart';
import 'package:milesed/bloc/state/dataState.dart';
import 'package:milesed/model/homedataModel.dart';
import 'package:milesed/model/testimonialModel.dart';
import 'package:milesed/services/apiServices.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final Apiservices serviceRepo = Apiservices();
  DataBloc() : super(HomeDataInit()) {
    on<GetHomeData>((event, emit) async {
      emit(HomeDataloading());
      try {
        final HomeDataModel data = await serviceRepo.getHomeData();
                print("testimonial data loaded");

        emit(HomeDataloaded(data: data));
      } catch (e) {
        emit(HomeDataError(err: e.toString()));
      }
    });
   
  }
}




class TestimonialDataBloc extends Bloc<DataEvent, DataState> {
  final Apiservices serviceRepo = Apiservices();
  TestimonialDataBloc() : super(TestimonialDataInit()) {
 
    on<GetTestimonialData>((event, emit) async {
      emit(TestimonialDataloading());
      try {
        final TestimonialsModal data = await serviceRepo.getTestimonalData();
        print("testimonial data loaded");
        emit(TestimonialDataloaded(data: data));
      } catch (e) {
        emit(TestimonialDataError(err: e.toString()));
      }
    });
  }
}













// class DataBloc extends Bloc<DataEvent, DataState> {
//   final String testimonialsUrl = 'https://file.notion.so/f/f/b56850fc-47bd-492c-a3da-2e8a8c5ddd0b/846b7db1-ffc4-4fb8-be96-879d160f228b/testimonials.json?table=block&id=11f3d626-2aa2-80f5-90b2-fb2a5cb3cda8&spaceId=b56850fc-47bd-492c-a3da-2e8a8c5ddd0b&expirationTimestamp=1730808000000&signature=BrsDAfHGToFbA5426H5HAA7LM9uzeZxixME4jlq021s&downloadName=testimonials.json';
//   final String homePageUrl = 'https://file.notion.so/f/f/b56850fc-47bd-492c-a3da-2e8a8c5ddd0b/cfa60c8b-5c47-415e-a8a8-457eed3190ff/home_page.json?table=block&id=11f3d626-2aa2-806c-8c0e-debca77c7929&spaceId=b56850fc-47bd-492c-a3da-2e8a8c5ddd0b&expirationTimestamp=1730808000000&signature=dyBvNAZjEwxfH-we_EYLbyha5vEkYrMV9Vxjrb9e1g8&downloadName=home_page.json';

//   DataBloc() : super(DataInitial());

//   @override
//   Stream<DataState> mapEventToState(DataEvent event) async* {
//     if (event is FetchTestimonials) {
//       yield DataLoading();
//       try {
//         final response = await http.get(Uri.parse(testimonialsUrl));
//         if (response.statusCode == 200) {
//           List<Testimonial> testimonials = (json.decode(response.body) as List)
//               .map((json) => Testimonial.fromJson(json))
//               .toList();
//           yield TestimonialsLoaded(testimonials);
//         } else {
//           yield DataError("Failed to fetch testimonials.");
//         }
//       } catch (e) {
//         yield DataError(e.toString());
//       }
//     } else if (event is FetchHomePageData) {
//       yield DataLoading();
//       try {
//         final response = await http.get(Uri.parse(homePageUrl));
//         if (response.statusCode == 200) {
//           HomePage homePage = HomePage.fromJson(json.decode(response.body));
//           yield HomePageLoaded(homePage);
//         } else {
//           yield DataError("Failed to fetch home page data.");
//         }
//       } catch (e) {
//         yield DataError(e.toString());
//       }
//     }
//   }
// }
