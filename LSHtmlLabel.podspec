

Pod::Spec.new do |spec|

  spec.name         = "LSHtmlLabel"
  spec.version      = "1.0.1"
  spec.summary      = "custom UILabel"
  spec.description  = <<-DESC
			一个点击文字跳链的UIlabel子类
                   DESC
  spec.homepage     = "https://github.com/lingshengjx/LSHtmlLabel"
  #spec.license      = "MIT (example)"
   spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "凌胜" => "lingshengjx@163.com" }
  spec.ios.deployment_target = '9.0'
 

  spec.source       = { :git => "https://github.com/lingshengjx/LSHtmlLabel.git", :tag => "#{spec.version}" }

  spec.source_files  = "LSHtmlLabel/*.{h,m}"
  #spec.exclude_files = "LSHtmlLabel/Exclude"


  #spec.framework = "UIKit"
  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

 

end
