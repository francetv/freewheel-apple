Pod::Spec.new do |s|
  s.name         = 'freewheel'
  s.version      = '2.5'
  s.summary      = 'francetv take on creating a pod for Freewheel AdManager iOS and tvOS SDK'
  s.homepage     = 'https://github.com/francetv/freewheel-apple'
  s.authors      = {
    'William Archimede' => 'william.archimede.ext@francetv.fr',
    'François Rouault' => 'francois.rouault.ext@francetv.fr',
    'Walid Kayhal' => 'walid.kayhal.ext@francetv.fr',
  }
  s.license      = {
    :type => 'Copyright',
    :file => 'LICENSE.txt'
  }
  s.source       = {
    :git => 'https://github.com/francetv/freewheel-apple.git',
    :tag => s.version.to_s
  }

  s.vendored_frameworks = 'AdManager.xcframework'

  #######
  # iOS #
  #######
  s.ios.deployment_target = '10.2'

  ########
  # tvOS #
  ########
  s.tvos.deployment_target = '12.2'

end
