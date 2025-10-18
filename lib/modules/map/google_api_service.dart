import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'google_api_service.g.dart';

@RestApi(baseUrl: "https://maps.googleapis.com/maps/api/")
abstract class GoogleApiService {
  factory GoogleApiService(Dio dio, {String baseUrl}) = _GoogleApiService;

  @GET("geocode/json")
  Future<HttpResponse<dynamic>> getAddressFromLatLng(
    @Query("latlng") String latlng,
    @Query("key") String apiKey,
  );

  @GET("place/autocomplete/json")
  Future<HttpResponse<dynamic>> getPlaceSuggestions(
    @Query("input") String input,
    @Query("key") String apiKey,
    @Query("components") String components, // e.g. "country:in"
  );
}
