Pod::Spec.new do |s|
    s.name              = "PrettyCircleView"
    s.module_name       = "PrettyCircleView"
    s.version           = "0.2.1"
    s.summary           = "A pretty view for  circle content."
    s.description       = "Rewritten UIView for rendering content in a circle."
    s.homepage          = "https://github.com/nab0y4enko/PrettyCircleView"
    s.license           = "MIT"
    s.author            = { "Oleksii Naboichenko" => "nab0y4enko@gmail.com" }
    s.social_media_url  = "https://twitter.com/nab0y4enko"

    s.source            = { :git => "https://github.com/nab0y4enko/PrettyCircleView.git", :tag => "#{s.version}" }
    s.source_files      = "Sources/**/*.swift"
    
    s.frameworks        = "UIKit", "CoreGraphics", "QuartzCore"

    s.ios.deployment_target = '8.0'

    s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '4.0' }
end
