Pod::Spec.new do |s|
  s.name         = "KOKeyboard"
  s.version      = "1.0"
  s.summary      = "KOKeyboard – iOS keyboard extension"
  s.description  = <<-DESC
                   KOKeyboard is an iOS drop-in component that adds a new row of keys to the default on-screen keyboard. It consists of swipe buttons with all common symbols, punctuation and brackets, and a special navigation key. It was developed for Kodiak PHP, an app which allows you to write and run PHP code directly on the iPad.
                   DESC
  s.homepage     = "https://github.com/4ntoine/KOKeyboard"
  s.license      = 'MIT License. See the file LICENSE for the complete text of the license.'
  s.author       = "Adam Horacek"
  s.source       = { :git => "https://github.com/4ntoine/KOKeyboard.git" }

  s.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.source_files = 'KOKeyboard/*.{h,m}'
  s.exclude_files = 'KOKeyboardDemo/*'
  s.frameworks = 'Foundation', 'CoreGraphics'
  s.libraries = 'System'
end
