#!/bin/bash
# Baut eine unsignierte electribe.ipa auf dem Desktop (zum Sideloaden)
set -e
cd "$(dirname "$0")"
npm install
npx cap sync ios
cd ios/App
rm -rf build
xcodebuild -workspace App.xcworkspace -scheme App -configuration Release -sdk iphoneos -destination 'generic/platform=iOS' -archivePath build/App.xcarchive archive CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY=""
cd build/App.xcarchive/Products/Applications
rm -rf Payload && mkdir Payload && cp -r App.app Payload/
rm -f ~/Desktop/electribe.ipa && zip -qr ~/Desktop/electribe.ipa Payload
echo "Fertig: ~/Desktop/electribe.ipa"
