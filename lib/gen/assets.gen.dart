/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Github.png
  AssetGenImage get github => const AssetGenImage('assets/images/Github.png');

  /// File path: assets/images/Linkedin.png
  AssetGenImage get linkedin =>
      const AssetGenImage('assets/images/Linkedin.png');

  /// File path: assets/images/contact.png
  AssetGenImage get contact => const AssetGenImage('assets/images/contact.png');

  /// File path: assets/images/experience_img_desktop.png
  AssetGenImage get experienceImgDesktop =>
      const AssetGenImage('assets/images/experience_img_desktop.png');

  /// File path: assets/images/experience_img_mobile.png
  AssetGenImage get experienceImgMobile =>
      const AssetGenImage('assets/images/experience_img_mobile.png');

  /// File path: assets/images/experience_img_tablet.png
  AssetGenImage get experienceImgTablet =>
      const AssetGenImage('assets/images/experience_img_tablet.png');

  /// File path: assets/images/header_img_desktop.png
  AssetGenImage get headerImgDesktop =>
      const AssetGenImage('assets/images/header_img_desktop.png');

  /// File path: assets/images/header_img_mobile.png
  AssetGenImage get headerImgMobile =>
      const AssetGenImage('assets/images/header_img_mobile.png');

  /// File path: assets/images/header_img_tablet.png
  AssetGenImage get headerImgTablet =>
      const AssetGenImage('assets/images/header_img_tablet.png');

  /// File path: assets/images/header_text_desktop.png
  AssetGenImage get headerTextDesktop =>
      const AssetGenImage('assets/images/header_text_desktop.png');

  /// File path: assets/images/header_text_mobile.png
  AssetGenImage get headerTextMobile =>
      const AssetGenImage('assets/images/header_text_mobile.png');

  /// File path: assets/images/header_text_tablet.png
  AssetGenImage get headerTextTablet =>
      const AssetGenImage('assets/images/header_text_tablet.png');

  /// File path: assets/images/profile_image_desktop.png
  AssetGenImage get profileImageDesktop =>
      const AssetGenImage('assets/images/profile_image_desktop.png');

  /// File path: assets/images/profile_image_mobile.png
  AssetGenImage get profileImageMobile =>
      const AssetGenImage('assets/images/profile_image_mobile.png');

  /// File path: assets/images/profile_image_tablet.png
  AssetGenImage get profileImageTablet =>
      const AssetGenImage('assets/images/profile_image_tablet.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        github,
        linkedin,
        contact,
        experienceImgDesktop,
        experienceImgMobile,
        experienceImgTablet,
        headerImgDesktop,
        headerImgMobile,
        headerImgTablet,
        headerTextDesktop,
        headerTextMobile,
        headerTextTablet,
        profileImageDesktop,
        profileImageMobile,
        profileImageTablet
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
