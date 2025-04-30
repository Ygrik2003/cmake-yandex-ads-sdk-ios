# cmake-yandex-ads-sdk-ios
Minimal example for reproduce linking error when using cmake

```cmake
cmake --preset xcode-ios
cmake --build --preset xcode-ios
```
Error:
```log
ld: warning: Could not find or use auto-linked framework 'CoreAudioTypes': framework 'CoreAudioTypes' not found
ld: warning: Could not find or use auto-linked framework 'MACAVPlayer': framework 'MACAVPlayer' not found
ld: warning: Could not find or use auto-linked framework 'MACAdsQuality': framework 'MACAdsQuality' not found
ld: warning: Could not find or use auto-linked framework 'MACAnalytics': framework 'MACAnalytics' not found
ld: warning: Could not find or use auto-linked framework 'MACBase': framework 'MACBase' not found
ld: warning: Could not find or use auto-linked framework 'MACBaseUI': framework 'MACBaseUI' not found
ld: warning: Could not find or use auto-linked framework 'MACCAChallengeHandler': framework 'MACCAChallengeHandler' not found
ld: warning: Could not find or use auto-linked framework 'MACClientBidding': framework 'MACClientBidding' not found
ld: warning: Could not find or use auto-linked framework 'MACConsent': framework 'MACConsent' not found
ld: warning: Could not find or use auto-linked framework 'MACConsentManagement': framework 'MACConsentManagement' not found
ld: warning: Could not find or use auto-linked framework 'MACConstants': framework 'MACConstants' not found
ld: warning: Could not find or use auto-linked framework 'MACCrashlytics': framework 'MACCrashlytics' not found
ld: warning: Could not find or use auto-linked framework 'MACDebugPanel': framework 'MACDebugPanel' not found
ld: warning: Could not find or use auto-linked framework 'MACDependenciesUmbrella': framework 'MACDependenciesUmbrella' not found
ld: warning: Could not find or use auto-linked framework 'MACDivKit': framework 'MACDivKit' not found
ld: warning: Could not find or use auto-linked framework 'MACEncryption': framework 'MACEncryption' not found
ld: warning: Could not find or use auto-linked framework 'MACEventTracking': framework 'MACEventTracking' not found
ld: warning: Could not find or use auto-linked framework 'MACFalseClickKit': framework 'MACFalseClickKit' not found
ld: warning: Could not find or use auto-linked framework 'MACFeatureFlags': framework 'MACFeatureFlags' not found
ld: warning: Could not find or use auto-linked framework 'MACHeaderBidding': framework 'MACHeaderBidding' not found
ld: warning: Could not find or use auto-linked framework 'MACLogging': framework 'MACLogging' not found
ld: warning: Could not find or use auto-linked framework 'MACMediation': framework 'MACMediation' not found
ld: warning: Could not find or use auto-linked framework 'MACMraid': framework 'MACMraid' not found
ld: warning: Could not find or use auto-linked framework 'MACNative': framework 'MACNative' not found
ld: warning: Could not find or use auto-linked framework 'MACNetworking': framework 'MACNetworking' not found
ld: warning: Could not find or use auto-linked framework 'MACPlatformDescription': framework 'MACPlatformDescription' not found
ld: warning: Could not find or use auto-linked framework 'MACSDKConfiguration': framework 'MACSDKConfiguration' not found
ld: warning: Could not find or use auto-linked framework 'MACStoreKit': framework 'MACStoreKit' not found
ld: warning: Could not find or use auto-linked framework 'MACTimeTracking': framework 'MACTimeTracking' not found
ld: warning: Could not find or use auto-linked framework 'MACVASTKit': framework 'MACVASTKit' not found
ld: warning: Could not find or use auto-linked framework 'MobileAdsCore': framework 'MobileAdsCore' not found
ld: warning: Could not parse or use implicit file '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/System/Library/Frameworks/SwiftUICore.framework/SwiftUICore.tbd': cannot link directly with 'SwiftUICore' because product being built is not an allowed client of it
Undefined symbols for architecture arm64:
  "AppMetricaLibraryAdapter.AppMetricaLibraryAdapter.reportEvent(sender: Swift.String, event: Swift.String, payload: Swift.String, onFailure: ((Swift.Error) -> ())?) -> ()", referenced from:
      MACAnalytics.MACAnonymousMetricaReporter.report(event: Swift.String, parameters: [Swift.String : Any], rawImpressionData: Swift.String?) -> () in YandexMobileAds[1076](MACAnonymousMetricaReporter.o)
  "static AppMetricaLibraryAdapter.AppMetricaLibraryAdapter.shared.getter : AppMetricaLibraryAdapter.AppMetricaLibraryAdapter", referenced from:
      MACAnalytics.MACAnonymousMetricaReporter.__allocating_init() -> MACAnalytics.MACAnonymousMetricaReporter in YandexMobileAds[1076](MACAnonymousMetricaReporter.o)
      MACAnalytics.MACMetricaAnalyticsTrackerFactory.makeAppAnalyticsTracker(statisticSendingEnabled: Swift.Bool) -> MACAnalytics.MACAppAnalyticsTracker in YandexMobileAds[1080](MACMetricaAnalyticsTrackerFactory.o)
      default argument 1 of MACAnalytics.MACMetricaAnalyticsTrackerFactory.init(analyticsEventTrackerProvider: MACAnalytics.MACAnalyticsEventTrackerProvider, adsMetricaAnalyticsTrackerFactory: MACAnalytics.MACAdsMetricaAnalyticsTrackerFactory) -> MACAnalytics.MACMetricaAnalyticsTrackerFactory in YandexMobileAds[1099](MACAnalyticsProvider.o)
  "AppMetricaLibraryAdapter.AppMetricaLibraryAdapter.activate() -> ()", referenced from:
      MACAnalytics.MACAnonymousMetricaReporter.activate() -> () in YandexMobileAds[1076](MACAnonymousMetricaReporter.o)
      protocol witness for MACAnalytics.MACAnonymousMetricaReporting.activate() -> () in conformance MACAnalytics.MACAnonymousMetricaReporter : MACAnalytics.MACAnonymousMetricaReporting in MACAnalytics in YandexMobileAds[1076](MACAnonymousMetricaReporter.o)
  "type metadata accessor for AppMetricaLibraryAdapter.AppMetricaLibraryAdapter", referenced from:
      MACAnalytics.MACAnonymousMetricaReporter.__allocating_init() -> MACAnalytics.MACAnonymousMetricaReporter in YandexMobileAds[1076](MACAnonymousMetricaReporter.o)
      MACAnalytics.MACMetricaAnalyticsTrackerFactory.makeAppAnalyticsTracker(statisticSendingEnabled: Swift.Bool) -> MACAnalytics.MACAppAnalyticsTracker in YandexMobileAds[1080](MACMetricaAnalyticsTrackerFactory.o)
      default argument 1 of MACAnalytics.MACMetricaAnalyticsTrackerFactory.init(analyticsEventTrackerProvider: MACAnalytics.MACAnalyticsEventTrackerProvider, adsMetricaAnalyticsTrackerFactory: MACAnalytics.MACAdsMetricaAnalyticsTrackerFactory) -> MACAnalytics.MACMetricaAnalyticsTrackerFactory in YandexMobileAds[1099](MACAnalyticsProvider.o)
  "nominal type descriptor for AppMetricaLibraryAdapter.AppMetricaLibraryAdapter", referenced from:
      _symbolic _____ 24AppMetricaLibraryAdapterAAC in YandexMobileAds[1076](MACAnonymousMetricaReporter.o)
  "static DivKitBinaryCompatibilityFacade.DivKitFacade.createView(json: [Swift.String : Any], localImageProvider: DivKitBinaryCompatibilityFacade.LocalImageProviding?, fontProvider: DivKitBinaryCompatibilityFacade.FontProviding?, customViewFactory: DivKitBinaryCompatibilityFacade.ContentViewFactory?, wrapperConfigurators: [DivKitBinaryCompatibilityFacade.WrapperViewConfigurator], urlHandler: DivKitBinaryCompatibilityFacade.UrlHandling) async -> __C.UIView", referenced from:
      (1) suspend resume partial function for closure #1 () async -> () in MACDivKit.MACDivKitViewImpl.useDesign(_: MACDivKit.MACDivKitDesign, resourceProviders: [MACDivKit.MACDivKitResourceProvider], completion: () -> ()) -> () in YandexMobileAds[1453](MACDivKitView.o)
  "async function pointer to static DivKitBinaryCompatibilityFacade.DivKitFacade.createView(json: [Swift.String : Any], localImageProvider: DivKitBinaryCompatibilityFacade.LocalImageProviding?, fontProvider: DivKitBinaryCompatibilityFacade.FontProviding?, customViewFactory: DivKitBinaryCompatibilityFacade.ContentViewFactory?, wrapperConfigurators: [DivKitBinaryCompatibilityFacade.WrapperViewConfigurator], urlHandler: DivKitBinaryCompatibilityFacade.UrlHandling) async -> __C.UIView", referenced from:
      (1) suspend resume partial function for closure #1 () async -> () in MACDivKit.MACDivKitViewImpl.useDesign(_: MACDivKit.MACDivKitDesign, resourceProviders: [MACDivKit.MACDivKitResourceProvider], completion: () -> ()) -> () in YandexMobileAds[1453](MACDivKitView.o)
  "protocol descriptor for DivKitBinaryCompatibilityFacade.DivKitFacadeWrapperView", referenced from:
      l_got.$s31DivKitBinaryCompatibilityFacade0abE11WrapperViewMp in YandexMobileAds[1434](MACAdDivWrapperBlock.o)
      l_got.$s31DivKitBinaryCompatibilityFacade0abE11WrapperViewMp in YandexMobileAds[1459](MACAdDivButtonBlockView.o)
      l_got.$s31DivKitBinaryCompatibilityFacade0abE11WrapperViewMp in YandexMobileAds[1460](MACAdDivImageBlockView.o)
      l_got.$s31DivKitBinaryCompatibilityFacade0abE11WrapperViewMp in YandexMobileAds[1461](MACAdDivLabelBlockView.o)
      l_got.$s31DivKitBinaryCompatibilityFacade0abE11WrapperViewMp in YandexMobileAds[1462](MACAdDivRatingBlockView.o)
      l_got.$s31DivKitBinaryCompatibilityFacade0abE11WrapperViewMp in YandexMobileAds[1463](MACAdDivViewBlockView.o)
      l_got.$s31DivKitBinaryCompatibilityFacade0abE11WrapperViewMp in YandexMobileAds[1464](MACWrapperMutableLabelConfigurator.o)
      ...
  "protocol descriptor for DivKitBinaryCompatibilityFacade.UrlHandling", referenced from:
      l_got.$s31DivKitBinaryCompatibilityFacade11UrlHandlingMp in YandexMobileAds[1442](MACDivUrlHandler.o)
  "protocol descriptor for DivKitBinaryCompatibilityFacade.FontProviding", referenced from:
      l_got.$s31DivKitBinaryCompatibilityFacade13FontProvidingMp in YandexMobileAds[1440](MACDivKitFontProvider.o)
      _symbolic ______pSg 31DivKitBinaryCompatibilityFacade13FontProvidingP in YandexMobileAds[1453](MACDivKitView.o)
  "protocol descriptor for DivKitBinaryCompatibilityFacade.ContentViewFactory", referenced from:
      l_got.$s31DivKitBinaryCompatibilityFacade18ContentViewFactoryMp in YandexMobileAds[1425](MACAdDivCustomBlockFactory.o)
      _symbolic ______pSg 31DivKitBinaryCompatibilityFacade18ContentViewFactoryP in YandexMobileAds[1453](MACDivKitView.o)
  "protocol descriptor for DivKitBinaryCompatibilityFacade.LocalImageProviding", referenced from:
      l_got.$s31DivKitBinaryCompatibilityFacade19LocalImageProvidingMp in YandexMobileAds[1437](MACAdDivLocalImageProvider.o)
      _symbolic ______pSg 31DivKitBinaryCompatibilityFacade19LocalImageProvidingP in YandexMobileAds[1453](MACDivKitView.o)
  "protocol descriptor for DivKitBinaryCompatibilityFacade.WrapperViewConfigurator", referenced from:
      l_got.$s31DivKitBinaryCompatibilityFacade23WrapperViewConfiguratorMp in YandexMobileAds[1434](MACAdDivWrapperBlock.o)
      _symbolic _____y______pG s23_ContiguousArrayStorageC 31DivKitBinaryCompatibilityFacade23WrapperViewConfiguratorP in YandexMobileAds[1453](MACDivKitView.o)
      l_got.$s31DivKitBinaryCompatibilityFacade23WrapperViewConfiguratorMp in YandexMobileAds[1464](MACWrapperMutableLabelConfigurator.o)
  "_OBJC_CLASS_$_AMAAppMetrica", referenced from:
       in YandexMobileAds[1077](MACAdsMetricaAnalyticsTracker.o)
  "_kAMADeviceIDKey", referenced from:
      MACAnalytics.MACIdentifiersLoaderImpl.loadIdentifiers(completionQueue: __C.OS_dispatch_queue, completion: (MACAnalytics.MACIdentifiers) -> ()) -> () in YandexMobileAds[1088](MACIdentifiersLoader.o)
      closure #1 () -> () in MACAnalytics.MACMetricaRawIdentifiersLoader.loadRawIndentifiers(completionQueue: __C.OS_dispatch_queue, completion: (Swift.Result<[Swift.AnyHashable : Any], Swift.Error>) -> ()) -> () in YandexMobileAds[1090](MACMetricaRawIdentifiersLoader.o)
      (extension in MACAnalytics):Swift.Dictionary< where A == Swift.AnyHashable, B == Any>.deviceID.getter : Swift.String? in YandexMobileAds[1091](MACRawIdentifiers.o)
      (extension in MACAnalytics):Swift.Dictionary< where A == Swift.AnyHashable, B == Any>.setDevideID(Swift.String?) -> () in YandexMobileAds[1091](MACRawIdentifiers.o)
      closure #1 (Swift.String) -> () in MACAnalytics.MACRawIdentifiersConverter.convertRawIdentifiers(_: [Swift.AnyHashable : Any]?, completion: (MACAnalytics.MACIdentifiers) -> ()) -> () in YandexMobileAds[1093](MACRawIdentifiersConverter.o)
  "_kAMAUUIDKey", referenced from:
      MACAnalytics.MACIdentifiersLoaderImpl.loadIdentifiers(completionQueue: __C.OS_dispatch_queue, completion: (MACAnalytics.MACIdentifiers) -> ()) -> () in YandexMobileAds[1088](MACIdentifiersLoader.o)
      closure #1 () -> () in MACAnalytics.MACMetricaRawIdentifiersLoader.loadRawIndentifiers(completionQueue: __C.OS_dispatch_queue, completion: (Swift.Result<[Swift.AnyHashable : Any], Swift.Error>) -> ()) -> () in YandexMobileAds[1090](MACMetricaRawIdentifiersLoader.o)
      (extension in MACAnalytics):Swift.Dictionary< where A == Swift.AnyHashable, B == Any>.uuid.getter : Swift.String? in YandexMobileAds[1091](MACRawIdentifiers.o)
      (extension in MACAnalytics):Swift.Dictionary< where A == Swift.AnyHashable, B == Any>.setUUID(Swift.String?) -> () in YandexMobileAds[1091](MACRawIdentifiers.o)
      closure #1 (Swift.String) -> () in MACAnalytics.MACRawIdentifiersConverter.convertRawIdentifiers(_: [Swift.AnyHashable : Any]?, completion: (MACAnalytics.MACIdentifiers) -> ()) -> () in YandexMobileAds[1093](MACRawIdentifiersConverter.o)
ld: symbol(s) not found for architecture arm64
clang: error: linker command failed with exit code 1 (use -v to see invocation)

note: Removed stale file '/Users/i_stepanov2/Documents/test/.build/xcode-ios/build/test-yandex-sdk.build/Debug-iphoneos/DerivedSources/test-yandex-sdk-Swift.h'

note: Removed stale file '/Users/i_stepanov2/Documents/test/.build/xcode-ios/build/test-yandex-sdk.build/Debug-iphoneos/Objects-normal/arm64/test-yandex-sdk-Swift.h'

note: Run script build phase 'Generate CMakeFiles/ZERO_CHECK' will be run during every build because the option to run the script phase "Based on dependency analysis" is unchecked. (in target 'ZERO_CHECK' from project 'test-yandex-sdk')
** BUILD FAILED **


The following build commands failed:
	Ld /Users/i_stepanov2/Documents/test/.build/xcode-ios/Debug-iphoneos/test-yandex-sdk.app/test-yandex-sdk normal (in target 'test-yandex-sdk' from project 'test-yandex-sdk')
(1 failure)
The command: /usr/local/bin/cmake --build /Users/i_stepanov2/Documents/test/.build/xcode-ios --target test-yandex-sdk -- exited with code: 65
Build completed: 00:00:10.779
Build finished with exit code 65

```
