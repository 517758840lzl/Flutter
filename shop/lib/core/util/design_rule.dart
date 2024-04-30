import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 针对不同平台设计不同界面
abstract class PlatformDesignRules {
  double getTarBarHeight();

  double getAppBarHeight();

  double getBottomNavigationBarHeight();
}

class DesignRules {
  static PlatformDesignRules getInstance() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidPlatformDesignRules();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return IosPlatformDesignRules();
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      return MacOsPlatformDesignRules();
    } else {
      return DefaultPlatformDesignRules();
    }
  }
}

// android
class AndroidPlatformDesignRules implements PlatformDesignRules {
  @override
  double getTarBarHeight() {
    return 45.r;
  }

  @override
  double getAppBarHeight() {
    return 50.r;
  }

  @override
  double getBottomNavigationBarHeight() {
    return 60.r;
  }
}

// Ios
class IosPlatformDesignRules implements PlatformDesignRules {
  @override
  double getTarBarHeight() {
    return 40.r;
  }

  @override
  double getAppBarHeight() {
    return 50.r;
  }

  @override
  double getBottomNavigationBarHeight() {
    return 85.r;
  }
}

// default
class DefaultPlatformDesignRules implements PlatformDesignRules {
  @override
  double getTarBarHeight() {
    return 40.r;
  }

  @override
  double getAppBarHeight() {
    return 50.r;
  }

  @override
  double getBottomNavigationBarHeight() {
    return 50.r;
  }
}

///MacOs
class MacOsPlatformDesignRules implements PlatformDesignRules {
  @override
  double getTarBarHeight() {
    return 40.r;
  }

  @override
  double getAppBarHeight() {
    return 50.r;
  }

  @override
  double getBottomNavigationBarHeight() {
    return 60.r;
  }
}
