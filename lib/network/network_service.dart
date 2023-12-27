import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import '../models/modals.dart';

const String logTag = "Network Service";

/// This will be our base path for network calls
const String baseUrl = "staging-api.astrotak.com";

/// This will be the path for fetch all question categories
const String questionPath = "api/question/category/all";

/// This path will be use for add a relative & Family member profile method POST
const String relative = "api/relative";

/// This path will be use to fetch all relative & Family member profile method GET
const String all = "all";

/// This path will be use to update all relative & Family member profile method POST
const String update = "update"; // {uuid} path parameter  also join this string

/// This path will be use to delete any relative & Family member profile method POST
const String delete = "delete"; // {uuid} path parameter  also join this string

/// This path is for get a place id by its name
const String locationPath = "api/location/place";
const String locationQuery = "inputPlace";

/// this is the token we use for API call in wide application for making network calls
const String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVHlwZSI6IlVTRVIiLCJ1dWlkIjoiYWVmODk1MDAtZDBmZS0xMWVjLWFhMWYtZGZjNDA3OWQ1YzhkIiwiaXNFbWFpbFZlcmlmaWVkIjp0cnVlLCJwaG9uZU51bWJlciI6Ijk3MTExODExOTgiLCJlbWFpbCI6Im1hbmF2Z2FyZzI3MkBnbWFpbC5jb20iLCJtYXNrZWRFbWFpbCI6Im1hbioqKioqKioqKmdtYWlsLmNvbSIsImV4aXN0aW5nVXNlciI6dHJ1ZSwiaWF0IjoxNjU0NzUyMzkyLCJleHAiOjE2NzQ3NTIzOTJ9.DxkKgpPadS8bn4dlDKXAH1Xrrs95mS2Z6dmngsAKBW8";

class NetworkService {
  static late Client client;

  static void create() {
    client = Client();
  }

  static Map<String, String> get headers => {
        HttpHeaders.contentTypeHeader: ContentType.json.toString(),
        HttpHeaders.authorizationHeader: "Bearer $token",
      };

  // Method Definition & Declaration for get Question Categories
  static Future<List<QuestionCategory>> getQuestions() async {
    List<QuestionCategory> categories = [];

    Uri url = Uri.https(baseUrl, questionPath);
    log("Info: " + url.toString(), name: logTag);
    Response response = await client.get(url, headers: headers);

    final String? contentType = response.headers[HttpHeaders.contentTypeHeader];
    var body = response.body;

    if (contentType != null &&
        contentType.contains(ContentType.json.toString())) {
      body = utf8.decode(response.bodyBytes);
    }

    Map data = json.decode(body);

    log("Info: " + json.encode(data), name: logTag);

    var list = data["data"] as List<dynamic>?;
    try {
      if (list != null) {
        for (var item in list) {
          categories.add(QuestionCategory.fromJson(item));
        }
      }
    } on Exception catch (e, stackTrace) {
      log("Warning: ", error: e, stackTrace: stackTrace, name: logTag);
    }

    return categories;
  }

  // Method cal for Fetch all Friends & Family Profile
  static Future<List<FamilyProfile>> getRelativeProfiles() async {
    List<FamilyProfile> profiles = [];

    Uri url = Uri.https(baseUrl, "$relative/$all");
    log("Info: " + url.toString(), name: logTag);
    Response response = await client.get(url, headers: headers);

    final String? contentType = response.headers[HttpHeaders.contentTypeHeader];
    var body = response.body;

    if (contentType != null &&
        contentType.contains(ContentType.json.toString())) {
      body = utf8.decode(response.bodyBytes);
    }

    Map data = json.decode(body);

    log("Info: " + json.encode(data), name: logTag);

    var list = data["data"]?["allRelatives"] as List<dynamic>?;

    try {
      if (list != null) {
        for (var item in list) {
          profiles.add(FamilyProfile.fromJson(item));
        }
      }
    } on Exception catch (e, stackTrace) {
      log("Warning: ", error: e, stackTrace: stackTrace, name: logTag);
    }

    return profiles;
  }

  // Method call For delete a Friend & Family Profile
  static Future<bool> deleteMember(String uuid) async {
    Uri url = Uri.https(baseUrl, "$relative/$delete/$uuid");
    log("Info: " + url.toString(), name: logTag);
    Response response = await client.post(url, headers: headers);

    final String? contentType = response.headers[HttpHeaders.contentTypeHeader];
    var body = response.body;

    if (contentType != null &&
        contentType.contains(ContentType.json.toString())) {
      body = utf8.decode(response.bodyBytes);
    }

    Map data = json.decode(body);

    log("Info: " + json.encode(data), name: logTag);

    var result = data["success"] as bool?;

    try {
      if (result != null) {
        return result;
      } else {
        return false;
      }
    } on Exception catch (e, stackTrace) {
      log("Warning: ", error: e, stackTrace: stackTrace, name: logTag);
      return false;
    }
  }

  // Method for fetch place id by place name
  static Future<List<Map<String, dynamic>>> getPlaceId(String placeName) async {
    List<Map<String, dynamic>> places = [];
    Map<String, dynamic> query = {locationQuery: placeName};
    Uri url = Uri.https(baseUrl, locationPath, query);
    log("Info: " + url.toString(), name: logTag);
    Response response = await client.get(url, headers: headers);

    final String? contentType = response.headers[HttpHeaders.contentTypeHeader];
    var body = response.body;

    if (contentType != null &&
        contentType.contains(ContentType.json.toString())) {
      body = utf8.decode(response.bodyBytes);
    }

    Map data = json.decode(body);

    var list = data["data"] as List<dynamic>?;

    try {
      if (list != null) {
        for (var item in list) {
          places.add(item);
        }
      }
    } on Exception catch (e, stackTrace) {
      log("Warning: ", error: e, stackTrace: stackTrace, name: logTag);
    }

    log("Info: " + json.encode(data), name: logTag);

    return places;
  }

  // Method for save a family & Friend Profile
  static Future<String> saveMember(Map<String, dynamic> payload) async {
    Uri url = Uri.https(baseUrl, relative);
    log("Info: " + url.toString(), name: logTag);
    Response response =
        await client.post(url, headers: headers, body: json.encode(payload));

    final String? contentType = response.headers[HttpHeaders.contentTypeHeader];
    var body = response.body;

    if (contentType != null &&
        contentType.contains(ContentType.json.toString())) {
      body = utf8.decode(response.bodyBytes);
    }

    Map data = json.decode(body);

    log("Info: " + json.encode(data), name: logTag);

    return data["message"];
  }
}
