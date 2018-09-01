Pod::Spec.new do |s|
          #1.
          s.name               = "AASideBar"
          #2.
          s.version            = "1.0.0"
          #3.  
          s.summary         = "Simple Side bar"
          #4.
          s.homepage        = "https://github.com/amir-ardalanuk/AASideBar"
          #5.
          s.license              = "MIT"
          #6.
          s.author               = "Amir Ardalan"
          #7.
          s.platform            = :ios, "10.0"
          #8.
          s.source              = { :git => "https://github.com/amir-ardalanuk/AASideBar.git", :tag => "1.0.0" }
          #9.
          s.source_files     = "AASideBar/*"
    end
