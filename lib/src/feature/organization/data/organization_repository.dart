import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/model/paginated_response.dart';
import 'package:optal_mobile/src/core/model/pagination_params.dart';
import 'package:optal_mobile/src/feature/organization/model/organization.dart';
import '../data/organization_network_data_provider.dart';

/// {@template organization_repository}
/// OrganizationRepository.
/// {@endtemplate}
abstract interface class OrganizationRepository {
  /// {@macro organization_repository}

  Future<PaginatedResponse<Organization>> listOrganization(
    PaginationParams paginationParams,
  );
}

/// {@template organization_repository_impl}
/// OrganizationRepositoryImpl.
/// {@endtemplate}
final class OrganizationRepositoryImpl implements OrganizationRepository {
  /// {@macro organization_repository_impl}
  const OrganizationRepositoryImpl({
    required OrganizationNetworkDataProvider network,
  }) : _network = network;

  final OrganizationNetworkDataProvider _network;

  @override
  Future<PaginatedResponse<Organization>> listOrganization(
    PaginationParams paginationParams,
  ) {
    return _network.listOrganization(paginationParams);
  }
}

final organizationRepositoryProvider = Provider<OrganizationRepository>((ref) {
  return OrganizationRepositoryImpl(
    network: ref.watch(organizationDataProvider),
  );
});
