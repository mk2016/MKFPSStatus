Pod::Spec.new do |s|
  s.name              = "MKFPSStatus"
  s.version           = "1.0.3"
  s.summary           = "show FPS on status bar."
  s.homepage          = "https://github.com/mk2016/MKFPSStatus"
  s.license           = "MIT"
  s.author            = { "MK Xiao" => "xiaomk7758@sina.com" }
  s.social_media_url  = "https://mk2016.github.io"
  s.platform          = :ios, "7.0"
  s.source            = { :git => "https://github.com/mk2016/MKFPSStatus.git", :tag => s.version }
  s.source_files      = "MKFPSStatus/MKFPSStatus"
  s.requires_arc      = true
end