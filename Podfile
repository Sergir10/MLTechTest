# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
workspace 'MLTechTest.xcworkspace'

target 'MLTechTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MLTechTest
  pod 'Kingfisher', '~> 6.0'

  target 'MLTechTestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MLTechCore' do
    project 'MLTechCore/MLTechCore'
  
    target 'MLTechCoreTests' do
      inherit! :search_paths
      # Pods for testing
    end
    
  end

end