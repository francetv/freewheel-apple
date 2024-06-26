# freewheel-apple

francetv take on creating a pod for Freewheel AdManager iOS and tvOS SDK

## Versions guide

| Pod | FW iOS | FW tvOS | Comments                                   |
| --- | ------ | ------- | ------------------------------------------ |
| 1   | 6.23.0 | 6.29.0  | /                                          |
| 2   | 6.38.0 | 6.38.0  | Dynamic framework (does not include OMSDK) |
| 2.1 | 6.38.0 | 6.38.0  | Remove remaining traces of OMSDK           |
| 2.2 | 6.38.0 | 6.38.0  | Fix CFBundleShortVersionString in plists   |
| 2.3 | 6.44.0 | 6.44.0  | Update version (xcframework)               |
| 2.4 | 6.50.0 | 6.50.0  | Update version (xcframework + OMSDK)       |
| 2.5 | 6.50.0 | 6.50.0  | Update environment and tools               |
| 2.6 | 6.60.0 | 6.59.0  | Update version                             |
| 2.7 | 6.60.0 | 6.59.0  | Fix pod with xcframework version           |
| 2.8 | 7.1.0  | 7.1.0   | Update version + PrivacyInfo.xcprivacy     |

_Note: we need to keep 2.x as long as [YouboraFreewheelAdapter](https://bitbucket.org/npaw/freewheel-adapter-ios) points to this pod `~> 2` (see [here](https://bitbucket.org/npaw/freewheel-adapter-ios/src/696bada67ca50924509670cf9d5e27fcc02a114b/YouboraFreewheelAdapter.podspec#lines-39))._
