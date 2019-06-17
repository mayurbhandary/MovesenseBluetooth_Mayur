# Movesense iOS and Android Libraries  

## News  

**(May 15th 2019) Update 1.34.1 to mobile libraries released**

Showcase app (ex _sampleapp_) for Android has been updated to version 1.9.5. Please find the apk in the "Downloads" section.
Please refer to [CHANGES.md](CHANGES.md) for more details.
  
**List of Movesense compatible mobile devices available**  
[Movesense documentation](https://bitbucket.org/suunto/movesense-docs/wiki/Home) contains a list of compatible mobile devices.

**Official Unity3D plugin**  
Check out news in [Movesense website](https://www.movesense.com/news/2018/09/movesense-plugin-for-unity3d/)

### 3rd party plugins

**React Native support**  
Check out Tugberk Akdogan's implementation on [Github](https://github.com/tugberka/react-native-mds)

**Xamarin plugin**  
Check out Andy Wigleys implementation in [Githib](https://github.com/AndyCW/MovesenseDotNet)


## iOS  

### Installation  

Movesense is available through [CocoaPods](http://cocoapods.org). To install it, make sure the following line is part of your Podfile (assumes properly configured ssh connection):  

`pod 'Movesense', :git => 'ssh://git@bitbucket.org:suunto/movesense-mobile-lib.git'`

### Building the example project  

To run the example project, clone the repo, and run `pod install` in the IOS/iOS-Example directory first. Make sure you have configured your ssh public key to bitbucket beforehand. This phase should not produce any errors:

```
$ cd IOS/iOS-Example/
$ pod install
Analyzing dependencies
Pre-downloading: `Movesense` from `ssh://git@bitbucket.org:suunto/movesense-mobile-lib.git`
Pre-downloading: `SwiftCharts` from `https://github.com/i-schuetz/SwiftCharts.git`, branch `master`
Downloading dependencies
Installing Movesense (1.0.0)
Installing PromiseKit (4.3.3)
Installing SwiftyJSON (3.1.4)
Installing Toast-Swift (2.0.0)
Generating Pods project
Integrating client project
Sending stats
Pod installation complete! There are 4 dependencies from the Podfile and 4 total pods installed.
```

Then open 'movesense-swiftapp.xcworkspace' in Xcode and build target 'movesense-swiftapp'. 

### Modifying bundle identifier  

You need to replace default 'com.suunto.movesense' bundle identifier with your own bundle identifier.

### Signing the application

In order to sign the application, you need to setup your own developer provisioning profile in Xcode.

### Running the application  

After the previous step, you are ready to go and can install the application on the device. 

However, you still need to enable the developer certificate on your iPhone in Settings -> General -> Device Management.

Finally, run the app!

### MDS Library usage  

See IOS/Movesense/readme.txt

## Android  

### Example  

Open 'Android/samples/ConnectivityAPISample/build.gradle' in Android Studio (the sample shows how to connect to Movesense and do a simple GET request).
For more complex data queries (such as reading data from sensors) consult *Android/samples/sampleapp*.

### Known issues  

Moving outside maximum BLE range can cause *Android/samples/sampleapp* to crash. *Android/samples/ConnectivityAPISample* should be able to properly handle these situations.  

## Firmware Update  

### Wireless Update over Bluetooth Low-energy (BLE)   

The latest Movesense device firmware supports wireless update using Nordic's DFU protocol. This requires operation of both the Movesense Example App as well as the Nordic's nRF Toolbox.

**WARNING: in case the new firmware is not based on the latest Movesense stack, the device looses the capability to be updated!!!**

![movesense-mobile-lib-dfu.png](https://bitbucket.org/repo/oGbGqA/images/26723009-movesense-mobile-lib-dfu.png)

## Frequently Asked Questions   

FAQ can be found via http://stackoverflow.com/search?q=movesense. If your problem is not addressed there, please [post](http://stackoverflow.com/questions/ask) a new question, and include [tag:movesense] in the message body.

## Bug Reports  

Please report bugs by [raising](https://bitbucket.org/suunto/movesense-mobile-lib/issues/new) an Issue via Bitbucket.

## Contributions  

Your input is appreciated and we encourage you to post your contributions as pull requests to this repository.

## License  

See the [LICENSE.pdf](./LICENSE.pdf) file for more info.