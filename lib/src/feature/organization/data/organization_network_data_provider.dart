import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/model/paginated_response.dart';
import 'package:optal_mobile/src/core/model/pagination_params.dart';
import 'package:optal_mobile/src/core/provider/dio_provider.dart';
import 'package:optal_mobile/src/feature/organization/model/organization.dart';

/// {@template organization_network_data_provider}
/// OrganizationNetworkDataProvider.
/// {@endtemplate}
abstract interface class OrganizationNetworkDataProvider {
  /// {@macro organization_network_data_provider}
  const OrganizationNetworkDataProvider();

  Future<PaginatedResponse<Organization>> listOrganization(
    PaginationParams paginationParams,
  );
}

/// {@template organization_network_data_provider}
/// OrganizationNetworkDataProviderImpl.
/// {@endtemplate}
final class OrganizationNetworkDataProviderImpl
    implements OrganizationNetworkDataProvider {
  /// {@macro organization_network_data_provider}
  const OrganizationNetworkDataProviderImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<PaginatedResponse<Organization>> listOrganization(
    PaginationParams paginationParams,
  ) async {
    final response = await _dio.get(
      '/v1/organizations/',
      queryParameters: paginationParams.toQuery(),
    );

    return PaginatedResponse.fromJson(response.data, Organization.fromJson);
  }
}

final organizationDataProvider = Provider<OrganizationNetworkDataProvider>((
  ref,
) {
  return OrganizationNetworkDataProviderImpl(dio: ref.watch(dioProvider));
});
