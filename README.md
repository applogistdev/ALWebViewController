# ALWebViewController 🌐

[![Version](https://img.shields.io/cocoapods/v/ALWebViewController.svg?style=flat)](https://cocoapods.org/pods/ALWebViewController)
[![License](https://img.shields.io/cocoapods/l/ALWebViewController.svg?style=flat)](https://cocoapods.org/pods/ALWebViewController)
[![Platform](https://img.shields.io/cocoapods/p/ALWebViewController.svg?style=flat)](https://cocoapods.org/pods/ALWebViewController)
[![Language](https://img.shields.io/badge/swift-5-orange.svg)](http://swift.org)


## Installation

**ALWebViewController** is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ALWebViewController'
```


## Usage

```swift
import ALWebViewController

// URL Example
let url = URL(string: "https://www.google.com")!
let urlType = ALWebContentType.url(url: url)
let webVC = ALWebViewController(content: type)
navigationController?.pushViewController(webVC, animated: true)

// Html String Example
var html = "<html><body><h1> Title </h1></body></html>"
let htmlType = ALWebContentType.html(html: html
let webVC = ALWebViewController(content: htmlType)
navigationController?.pushViewController(webVC, animated: true)


// ALWebViewDelegate

extension ViewController: ALWebViewDelegate {
    func webView(didStartLoading webVC: ALWebViewController) {
        debugPrint("Start Loading")
    }
    
    func webView(didFinishLoading webVC: ALWebViewController) {
        debugPrint("Finish Loading")
    }
}

```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## Author

Soner Güler, sonerguler93@gmail.com
Ünal Çelik, unal.celik@applogist.com

## License

ALWebViewController is available under the MIT license. See the LICENSE file for more info.
