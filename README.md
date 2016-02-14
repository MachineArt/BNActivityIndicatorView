# BNActivityIndicatorView

Custom UIActivityIndicatorView written in Swift that allows you to display a custom indicator image.


### How use it

```swift
// How use it
activityIndicatorView = BNActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
activityIndicatorView.image = UIImage(named:"activityIndicator.png")

activityIndicatorView.center = self.view.center;
self.view.addSubview(activityIndicatorView)
activityIndicatorView.startAnimating()

```

### Indicator's frame option

```swift
// Set the image frame to be same size as the selected system UIActivityIndicatorViewStyle's frame
// in this case UIActivityIndicatorViewStyle.WhiteLarge, so the size will be 37x37
activityIndicatorView.fitSystemIndicatorFrame = true
activityIndicatorView.image = UIImage(named:"activityIndicator.png")

```

### Preview
![BackgroundImage](https://github.com/MachineArt/BNActivityIndicatorView/blob/master/Screenshot.png)


Collaboration
---

If there are ways of adding more features, please feel free to collaborate with ideas, and/or pull requests.
