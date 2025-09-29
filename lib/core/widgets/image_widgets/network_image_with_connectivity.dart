import 'dart:io';

import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/providers/connectivity_providers.dart';
import 'package:finny/core/widgets/image_widgets/image_error_widget.dart';
import 'package:finny/core/widgets/image_widgets/image_placeholder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class NetworkSvgWithConnectivity extends ConsumerWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final String? errorMessage;
  final bool showConnectivityError;
  final BorderRadius? borderRadius;
  final Border? border;

  const NetworkSvgWithConnectivity({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.errorMessage,
    this.showConnectivityError = true,
    this.borderRadius,
    this.border,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityState = ref.watch(connectivityStateProvider);
    return connectivityState.when(
      data: (isConnected) {
        if (!isConnected && showConnectivityError) {
          return _buildConnectivityErrorWidget(context);
        }
        return _buildSvgImage(context);
      },
      loading: () => _buildPlaceholder(context),
      error: (_, __) => _buildSvgImage(context),
    );
  }

  Widget _buildSvgImage(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkImageUrl(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildPlaceholder(context);
        }

        if (snapshot.hasError || snapshot.data == false) {
          return _buildConnectivityErrorWidget(context);
        }

        return _buildSvgWidget(context);
      },
    );
  }

  Widget _buildSvgWidget(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: border ?? Border.all(color: context.colorScheme.secondaryFixed, width: 1),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: SvgPicture.network(
          imageUrl,
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          placeholderBuilder: (context) => _buildPlaceholder(context),
          errorBuilder: (context, error, stackTrace) {
            if (error is SocketException || error.toString().contains('Failed host lookup') || error.toString().contains('No address associated with hostname')) {
              return _buildConnectivityErrorWidget(context);
            }
            return errorWidget ?? _buildErrorWidget(context);
          },
        ),
      ),
    );
  }

  Future<bool> _checkImageUrl() async {
    try {
      final uri = Uri.parse(imageUrl);
      final client = HttpClient();
      final request = await client.getUrl(uri);
      final response = await request.close();
      client.close();
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  Widget _buildPlaceholder(BuildContext context) {
    return placeholder ??
        ImagePlaceholderWidget(
          width: width,
          height: height,
          backgroundColor: context.colorScheme.surfaceContainerHighest,
          iconColor: context.colorScheme.primary,
        );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return errorWidget ??
        ImageErrorWidget(
          width: width,
          height: height,
          backgroundColor: context.colorScheme.surfaceContainerHighest,
          iconColor: context.colorScheme.onSurfaceVariant,
          icon: Icons.image_not_supported,
        );
  }

  Widget _buildConnectivityErrorWidget(BuildContext context) {
    return ImageErrorWidget(
      width: width,
      height: height,
      backgroundColor: context.colorScheme.surfaceContainerHighest,
      iconColor: context.colorScheme.error,
      icon: Icons.wifi_off,
      message: errorMessage ?? 'Sin conexión',
    );
  }
}
