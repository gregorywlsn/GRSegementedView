# GRSegementedView

Nice animated custom segment control which can be used insted of UISegmentedControl

![demo](https://github.com/gregorywlsn/GRSegementedView/blob/master/Example/Resources/segment.gif)

## Example

To run the example project, clone the repo, and run the code.

## Installation
### Manually:

* Download GRSegementedView or Clone Download.
* Drag and drop GRSegementedView directory to your project

## Usage

Create a UIView in the StoryBoard and subclass it as GRSegmentedView and create outlet for it.
Then use the code:
```swift 
segmentView.segmentTitles = ["One", "Two", "Three"]
segmentView.selectionTitleColor = .white
segmentView.deselectionTitleColor = .white
segmentView.selectorColor = .brown
segmentView.delegate = self
```
   ### Delegate
```swift
func didSelected(_ segmentControl: GRSegmentedView, at index: Int) {
    print("Selecetd Index: ", index)
}
   ```
   ## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.
- Or you can **mail** me
- Will try to improve the class and add new features.

## Author

Gregory Wilson, gregorywlsn0111@gmail.com

## License

GRSegementedView is available under the MIT license. See the LICENSE file for more info.
