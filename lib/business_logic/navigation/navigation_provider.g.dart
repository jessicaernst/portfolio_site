// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(NavigationNotifier)
const navigationNotifierProvider = NavigationNotifierProvider._();

final class NavigationNotifierProvider
    extends $NotifierProvider<NavigationNotifier, int> {
  const NavigationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigationNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigationNotifierHash();

  @$internal
  @override
  NavigationNotifier create() => NavigationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$navigationNotifierHash() =>
    r'b265ab84d22a99a7e35313fad5525cd28204eb2d';

abstract class _$NavigationNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
