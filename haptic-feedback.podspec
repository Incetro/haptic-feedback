Pod::Spec.new do |spec|
  spec.name          = 'haptic-feedback'
  spec.module_name   = 'HapticFeedback'
  spec.version       = '1.0.1'
  spec.license       = 'MIT'
  spec.authors       = { 'incetro' => 'incetro@ya.ru', 'Alexander Lezya' => 'Lezya007@gmail.com' }
  spec.homepage      = "https://github.com/Incetro/haptic-feedback.git"
  spec.summary       = 'Open Source'
  spec.platform      = :ios, "10.0"
  spec.swift_version = '4.0'
  spec.source        = { git: "https://github.com/Incetro/haptic-feedback.git", tag: "#{spec.version}" }
  spec.source_files  = "Sources/HapticFeedback/**/*.{h,swift}"
  spec.dependency "DeviceKit"
end