import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/model/fabric_exception.dart';
import 'package:optal_mobile/src/core/model/paginated_response.dart';
import 'package:optal_mobile/src/core/model/pagination_params_dto.dart';
import 'package:optal_mobile/src/core/provider/dio_provider.dart';
import 'package:optal_mobile/src/feature/fabric/model/fabric.dart';

final fabricDataSourcesProvider = Provider<FabricDataSources>((ref) {
  return FabricDataSourcesImpl(dio: ref.read(dioProvider));
});

/// {@template fabric_data_sources}
/// FabricDataSources.
/// {@endtemplate}
abstract interface class FabricDataSources {
  /// {@macro fabric_data_sources}

  Future<PaginatedResponse<Fabric>> listFabrics(
    PaginationParamsDto paginationparamsDto,
  );

  Future<Fabric> createFabric(Fabric fabric);

  Future<PaginatedResponse<Fabric>> listSupplierFabrics(
    PaginationParamsDto paginationparamsDto,
    int supplierId,
  );

  Future<Fabric> getFabricById(int id);

  Future<Fabric> updateFabric(Fabric fabric, String id);

  Future<Fabric> deleteFabric(int id);

  Future<Fabric> updateFabricStock(int id);
}

/// {@template fabric_data_sources}
/// FabricDataSourcesImpl.
/// {@endtemplate}
final class FabricDataSourcesImpl implements FabricDataSources {
  /// {@macro fabric_data_sources}
  const FabricDataSourcesImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<Fabric> createFabric(Fabric fabric) async {
    final response = await _dio.post("/v1/fabrics", data: fabric.toJson());

    return Fabric.fromJson(response.data);
  }

  @override
  Future<Fabric> deleteFabric(int id) async {
    final response = await _dio.delete("/v1/fabrics/$id");

    return Fabric.fromJson(response.data);
  }

  @override
  Future<Fabric> getFabricById(int id) async {
    final response = await _dio.get('/v1/fabrics/$id');

    if (response.statusCode == 404) {
      Error.throwWithStackTrace(
        FabricException.fromCode(response.statusCode),
        StackTrace.current,
      );
    }

    return Fabric.fromJson(response.data);
  }

  @override
  Future<PaginatedResponse<Fabric>> listFabrics(
    PaginationParamsDto paginationparamsDto,
  ) async {
    final response = await _dio.get(
      '/v1/fabrics',
      data: paginationparamsDto.toJson(),
    );

    return PaginatedResponse<Fabric>.fromJson(response.data, Fabric.fromJson);
  }

  @override
  Future<PaginatedResponse<Fabric>> listSupplierFabrics(
    PaginationParamsDto paginationparamsDto,
    int supplierId,
  ) async {
    final response = await _dio.get(
      '/v1/fabrics/supplier/',
      queryParameters: paginationparamsDto.toJson(),
    );

    return PaginatedResponse<Fabric>.fromJson(response.data, Fabric.fromJson);
  }

  @override
  Future<Fabric> updateFabric(Fabric fabric, String id) async {
    final response = await _dio.put("/v1/fabrics/$id");

    return Fabric.fromJson(response.data);
  }

  @override
  Future<Fabric> updateFabricStock(int id) {
    // TODO: implement updateFabricStock
    throw UnimplementedError();
  }
}
