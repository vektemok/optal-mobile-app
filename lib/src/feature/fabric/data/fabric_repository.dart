import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/model/paginated_response.dart';
import 'package:optal_mobile/src/core/model/pagination_params_dto.dart';
import 'package:optal_mobile/src/feature/fabric/data/fabric_data_sources.dart';
import 'package:optal_mobile/src/feature/fabric/model/fabric.dart';

abstract interface class FabricRepository {
  Future<PaginatedResponse<Fabric>> listFabrics(PaginationParamsDto params);
  Future<PaginatedResponse<Fabric>> listSupplierFabrics(
    PaginationParamsDto params,
    int supplierId,
  );
  Future<Fabric> getFabricById(int id);
  Future<Fabric> createFabric(Fabric fabric);
  Future<Fabric> updateFabric(Fabric fabric);
  Future<Fabric> deleteFabric(int id);
  Future<Fabric> updateFabricStock(int id);
}

final class FabricRepositoryImpl implements FabricRepository {
  const FabricRepositoryImpl(this._datasource);

  final FabricDataSources _datasource;

  @override
  Future<PaginatedResponse<Fabric>> listFabrics(PaginationParamsDto params) =>
      _datasource.listFabrics(params);

  @override
  Future<PaginatedResponse<Fabric>> listSupplierFabrics(
    PaginationParamsDto params,
    int supplierId,
  ) => _datasource.listSupplierFabrics(params, supplierId);

  @override
  Future<Fabric> getFabricById(int id) => _datasource.getFabricById(id);

  @override
  Future<Fabric> createFabric(Fabric fabric) =>
      _datasource.createFabric(fabric);

  @override
  Future<Fabric> updateFabric(Fabric fabric) =>
      _datasource.updateFabric(fabric, fabric.id.toString());

  @override
  Future<Fabric> deleteFabric(int id) => _datasource.deleteFabric(id);

  @override
  Future<Fabric> updateFabricStock(int id) => _datasource.updateFabricStock(id);
}

final fabricRepositoryProvider = Provider<FabricRepository>((ref) {
  return FabricRepositoryImpl(ref.read(fabricDataSourcesProvider));
});
