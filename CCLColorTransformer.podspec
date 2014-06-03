Pod::Spec.new do |s|
  s.name             = "CCLColorTransformer"
  s.version          = '1.0.0'
  s.summary          = "A value transformer to store a color"
  s.homepage         = "https://github.com/cocodelabs/CCLColorTransformer"
  s.license          = 'MIT'
  s.author           = { "Kyle Fuller" => "inbox@kylefuller.co.uk" }
  s.source           = { :git =>
"https://github.com/cocodelabs/CCLColorTransformer.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/kylefuller'

  s.platform     = :osx, '10.7'
  s.requires_arc = true

  s.source_files = 'Classes'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
end

