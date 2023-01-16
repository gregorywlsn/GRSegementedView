#
# Be sure to run `pod lib lint GRSegementedView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GRSegementedView'
  s.version          = '0.1.0'
  s.summary          = 'A nice animated Segmented Control.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'Nice animated custom segment control which can be used insted of UISegmentedControl'
                       DESC

  s.homepage         = 'https://github.com/gregorywlsn/GRSegementedView'
  s.screenshots     = 'https://raw.githubusercontent.com/gregorywlsn/GRSegmentedView/master/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gregorywlsn' => 'gregorywlsn0111@gmail.com' }
  s.source           = { :git => 'https://github.com/gregorywlsn/GRSegementedView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/gregory-wilson-549241118/'

  s.ios.deployment_target = '12.0'

  s.source_files = 'GRSegementedView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'GRSegementedView' => ['GRSegementedView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
