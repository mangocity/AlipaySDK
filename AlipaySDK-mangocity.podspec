Pod::Spec.new do |s|
  s.name              = "AlipaySDK-mangocity”
  s.version           = "15.0.2"
  s.summary           = "Alipay SDK for iOS. You can create alipay order or sign orders with `Order` subspec."
  s.homepage          = "https://b.alipay.com/newIndex.htm"
  s.license           = {
    :type => 'Copyright',
    :text => <<-LINCENSE
      支付宝(中国)网络技术有限公司 ^? 版权所有.
      LINCENSE
  }
  s.author            = { "AliPay" => "http://www.alipay.com/" }
  s.platform          = :ios, '6.0'
  s.requires_arc      = true

  s.source            = { :git => "https://github.com/mangocity/AlipaySDK.git”, :tag => "#{s.version}" }
  s.frameworks        = 'CoreTelephony', 'SystemConfiguration', 'CoreMotion'
  s.libraries         = 'z', 'c++'

  s.default_subspec   = 'Core'

  s.subspec "Core" do |core|
    core.source_files = 'AlixPayResult'
    core.resources    = 'AlipaySDK.bundle'
    core.vendored_frameworks = 'AlipaySDK.framework'
    core.public_header_files = 'AlipaySDK.framework/Headers/**/*.h'
  end

  s.subspec "Order" do |order|
    order.source_files = 'openssl/*.{h,m}'
    order.dependency 'AlipaySDK-mangocity/Core'
    order.dependency 'OpenSSL'
    order.dependency 'PupaFoundation'
  end

end
