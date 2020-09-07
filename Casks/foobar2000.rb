cask 'foobar2000' do
  version '2.2.6'
  sha256 '798905677c91e385b2a65b9868f25aa1201be69855350af298db4c1b02268eb0'

  # url is unstable"
  url do
    require 'open-uri'
    base = 'https://www.foobar2000.org'
    download_page = URI("#{base}/mac").read.scan(%r{href="([^"]+v#{version}.dmg)"}).flatten.first
    file = URI("#{base}#{download_page}").read.scan(%r{href="([^"]+v#{version}.dmg)"}).flatten.first
    "#{base}#{file}"
  end
  appcast 'https://www.foobar2000.org/changelog-mac'
  name 'foobar2000'
  homepage 'https://www.foobar2000.org/mac'

  app 'foobar2000.app'

  zap trash: [
               '~/Library/foobar2000',
               '~/Library/Preferences/com.foobar2000.mac.plist',
             ]
end
