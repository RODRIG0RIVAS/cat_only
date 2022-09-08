// Mocks generated by Mockito 5.3.0 from annotations
// in cat_only/test/lib/controllers/home/home_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cat_api/api/domain/entities/cat_raw/cat_raw.dart' as _i6;
import 'package:cat_api/api/domain/exceptions/cat_raw/cat_raw_exception.dart'
    as _i5;
import 'package:cat_api/api/domain/usecases/get_cat_page_limit.dart' as _i3;
import 'package:dependency/dependency.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [GetCatPageLimitImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCatPageLimitImpl extends _i1.Mock
    implements _i3.GetCatPageLimitImpl {
  MockGetCatPageLimitImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.CatRawException, List<_i6.CatRaw>>> call(
          int? page, int? limit) =>
      (super.noSuchMethod(Invocation.method(#call, [page, limit]),
          returnValue:
              _i4.Future<_i2.Either<_i5.CatRawException, List<_i6.CatRaw>>>.value(
                  _FakeEither_0<_i5.CatRawException, List<_i6.CatRaw>>(
                      this, Invocation.method(#call, [page, limit])))) as _i4
          .Future<_i2.Either<_i5.CatRawException, List<_i6.CatRaw>>>);
}
