import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Prompts Group Code

class PromptsGroup {
  static String baseUrl = 'https://turboqueries-p67td2b2aq-uc.a.run.app';
  static Map<String, String> headers = {};
}

/// End Prompts Group Code

class GPTqueryCall {
  static Future<ApiCallResponse> call({
    String? qid = '',
    String? idToken = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GPTqueryCall',
        'variables': {
          'qid': qid,
          'idToken': idToken,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ScrapeServerCall {
  static Future<ApiCallResponse> call({
    String? sourceUrl = '',
    String? idToken = '',
    String? datasetId = '',
    String? datasetName = '',
    String? urlId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ScrapeServerCall',
        'variables': {
          'sourceUrl': sourceUrl,
          'idToken': idToken,
          'datasetId': datasetId,
          'datasetName': datasetName,
          'urlId': urlId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DownloadServerCall {
  static Future<ApiCallResponse> call({
    String? qid = '',
    String? idToken = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DownloadServerCall',
        'variables': {
          'qid': qid,
          'idToken': idToken,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class MultipleFileUploadCall {
  static Future<ApiCallResponse> call({
    String? idToken = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'MultipleFileUploadCall',
        'variables': {
          'idToken': idToken,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RecursiveSummarizerCall {
  static Future<ApiCallResponse> call({
    String? idToken = '',
    List<String>? datasetIdsList,
    String? qid = '',
  }) async {
    final datasetIds = _serializeList(datasetIdsList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RecursiveSummarizerCall',
        'variables': {
          'idToken': idToken,
          'datasetIds': datasetIds,
          'qid': qid,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class MixedChatCall {
  static Future<ApiCallResponse> call({
    String? idToken = '',
    String? qid = '',
    String? cid = '',
    List<String>? datasetIdsList,
    int? topK,
    String? guardrail = '',
  }) async {
    final datasetIds = _serializeList(datasetIdsList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'MixedChatCall',
        'variables': {
          'idToken': idToken,
          'qid': qid,
          'cid': cid,
          'datasetIds': datasetIds,
          'topK': topK,
          'guardrail': guardrail,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class MixedQueryCall {
  static Future<ApiCallResponse> call({
    String? idToken = '',
    String? qid = '',
    List<String>? datasetIdsList,
    int? topK,
    String? guardrail = '',
  }) async {
    final datasetIds = _serializeList(datasetIdsList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'MixedQueryCall',
        'variables': {
          'idToken': idToken,
          'qid': qid,
          'datasetIds': datasetIds,
          'topK': topK,
          'guardrail': guardrail,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class PromptLabCall {
  static Future<ApiCallResponse> call({
    String? plid = '',
    String? idToken = '',
    List<String>? datasetIdsList,
  }) async {
    final datasetIds = _serializeList(datasetIdsList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'PromptLabCall',
        'variables': {
          'plid': plid,
          'idToken': idToken,
          'datasetIds': datasetIds,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ShareChatCall {
  static Future<ApiCallResponse> call({
    String? bid = '',
    String? cid = '',
    String? qid = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ShareChatCall',
        'variables': {
          'bid': bid,
          'cid': cid,
          'qid': qid,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
