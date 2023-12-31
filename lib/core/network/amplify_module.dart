import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:gimme_delivery/amplifyconfiguration.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';

import 'package:injectable/injectable.dart';

@Injectable()
class AmplifyModule {
  final AmplifyClass amplify = Amplify;
  final APIAuthorizationType _authType = APIAuthorizationType.userPools;

  Future<void> configureAmplify() async {
    final ModelProvider modelProvider = ModelProvider();
    final AmplifyAuthCognito auth = AmplifyAuthCognito();
    final AmplifyAnalyticsPinpoint analytics = AmplifyAnalyticsPinpoint();
    final AmplifyAPI api = AmplifyAPI(modelProvider: modelProvider);

    try {
      await amplify.addPlugins([auth, analytics, api]);
      await amplify.configure(amplifyconfig);
    } catch (e) {
      throw const NetworkException('Error when initialize Amplify');
    }
  }

  Future<CognitoUserPoolTokens> _getUserToken() async {
    var session = await amplify.Auth.fetchAuthSession();

    var dataSession = session.toJson();

    CognitoUserPoolTokens tokens =
        dataSession['userPoolTokens'] as CognitoUserPoolTokens;
    return tokens;
  }

  Future<GraphQLResponse<PaginatedResult<T>>> getListData<T extends Model>(
      {required ModelType<T> modelType, bool isUseAuthorized = true}) async {
    GraphQLRequest<PaginatedResult<T>> request;

    if (isUseAuthorized) {
      var tokens = await _getUserToken();
      request = ModelQueries.list<T>(
        modelType,
        authorizationMode: _authType,
        headers: {'Authorization': 'Bearer ${tokens.accessToken.raw}'},
      );
    } else {
      request = ModelQueries.list<T>(modelType);
    }

    return amplify.API.query(request: request).response;
  }

  Future<GraphQLResponse<String>> getListQueryData(
      {required String query, bool isUseAuthorized = true}) async {
    GraphQLRequest<String> queryRequest;

    if (isUseAuthorized) {
      var tokens = await _getUserToken();
      queryRequest = GraphQLRequest(
        document: query,
        authorizationMode: _authType,
        headers: {'Authorization': 'Bearer ${tokens.accessToken.raw}'},
      );
    } else {
      queryRequest = GraphQLRequest(document: query);
    }

    return amplify.API.query(request: queryRequest).response;
  }

  Future<GraphQLResponse<T>> create<T extends Model>({required T model}) async {
    GraphQLRequest<T> request;
    var tokens = await _getUserToken();
    request = ModelMutations.create(
      model,
      authorizationMode: _authType,
      headers: {'Authorization': 'Bearer ${tokens.accessToken.raw}'},
    );
    return amplify.API.mutate(request: request).response;
  }
}
