Pod::Spec.new do |s|
    s.name         = "PrettyCircleView"
    s.version      = "0.1.3"
    s.summary      = "A pretty view for  circle content"
    s.description = <<-DESC
                    Rewritten UIView for rendering content in a circle.
                    DESC
    s.homepage     = "https://github.com/nab0y4enko/PrettyCircleView"
    s.license      = "MIT"
    s.author              = { "Oleksii Naboichenko" => "nab0y4enko@gmail.com" }
    s.social_media_url    = "https://twitter.com/nab0y4enko"
    s.ios.deployment_target = '8.0'
    s.source          = { :git => "https://github.com/nab0y4enko/PrettyCircleView.git", :tag => "#{s.version}" }
    s.source_files    = "Sources/**/*.swift"
    s.frameworks      = "UIKit", "CoreGraphics", "QuartzCore"
    s.requires_arc    = true
end
