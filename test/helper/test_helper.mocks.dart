// Mocks generated by Mockito 5.4.3 from annotations
// in fitpage/test/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:fitpage/core/resources/data_state.dart' as _i2;
import 'package:fitpage/features/stocks/data/data_sources/stock_service.dart'
    as _i5;
import 'package:fitpage/features/stocks/domain/repository/stock_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDataState_0<T> extends _i1.SmartFake implements _i2.DataState<T> {
  _FakeDataState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [StockRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockStockRepository extends _i1.Mock implements _i3.StockRepository {
  MockStockRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.DataState<dynamic>> getStocks() => (super.noSuchMethod(
        Invocation.method(
          #getStocks,
          [],
        ),
        returnValue:
            _i4.Future<_i2.DataState<dynamic>>.value(_FakeDataState_0<dynamic>(
          this,
          Invocation.method(
            #getStocks,
            [],
          ),
        )),
      ) as _i4.Future<_i2.DataState<dynamic>>);
}

/// A class which mocks [StockService].
///
/// See the documentation for Mockito's code generation for more information.
class MockStockService extends _i1.Mock implements _i5.StockService {
  MockStockService() {
    _i1.throwOnMissingStub(this);
  }
}
