# flutter_avanzado_viajes

You must add your own google firebase credencial:

* /android/app/google-services.json
* /ios/Runner/GoogleService-Info.plist


## Example

For /android/app/google-services.json:

```
{
  "project_info": {
    "project_number": "589162289045",
    "project_id": "flutter-viajes",
    "storage_bucket": "flutter-viajes.appspot.com"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:589162289045:android:ebaaf798c7d46684e9089c",
        "android_client_info": {
          "package_name": "com.example.flutter_avanzado_viajes"
        }
      },
      "oauth_client": [
        {
          "client_id": "YOUR OWN ID PROVIDED BY GOOGLE FIRESTORE",
          "client_type": 3
        }
      ],
      "api_key": [
        {
          "current_key": "YOUR OWN KEY PROVIDED BY GOOGLE FIRESTORE"
        }
      ],
      "services": {
        "appinvite_service": {
          "other_platform_oauth_client": [
            {
              "client_id": "YOUR OWN ID PROVIDED BY GOOGLE FIRESTORE",
              "client_type": 3
            },
            {
              "client_id": "YOUR OWN ID PROVIDED BY GOOGLE FIRESTORE",
              "client_type": 2,
              "ios_info": {
                "bundle_id": "com.example.flutterAvanzadoViajes"
              }
            }
          ]
        }
      }
    }
  ],
  "configuration_version": "1"
}
```

For /ios/Runner/GoogleService-Info.plist:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CLIENT_ID</key>
	<string>YOUR OWN ID PROVIDED BY GOOGLE FIRESTORE</string>
	<key>REVERSED_CLIENT_ID</key>
	<string>YOUR OWN ID PROVIDED BY GOOGLE FIRESTORE</string>
	<key>API_KEY</key>
	<string>YOUR OWN KEY PROVIDED BY GOOGLE FIRESTORE</string>
	<key>GCM_SENDER_ID</key>
	<string>589162289045</string>
	<key>PLIST_VERSION</key>
	<string>1</string>
	<key>BUNDLE_ID</key>
	<string>com.example.flutterAvanzadoViajes</string>
	<key>PROJECT_ID</key>
	<string>flutter-viajes</string>
	<key>STORAGE_BUCKET</key>
	<string>flutter-viajes.appspot.com</string>
	<key>IS_ADS_ENABLED</key>
	<false></false>
	<key>IS_ANALYTICS_ENABLED</key>
	<false></false>
	<key>IS_APPINVITE_ENABLED</key>
	<true></true>
	<key>IS_GCM_ENABLED</key>
	<true></true>
	<key>IS_SIGNIN_ENABLED</key>
	<true></true>
	<key>GOOGLE_APP_ID</key>
	<string>YOUR OWN ID PROVIDED BY GOOGLE FIRESTORE</string>
</dict>
</plist>
```
