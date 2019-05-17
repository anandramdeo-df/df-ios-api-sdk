# DataFornix Mobile API SDK

This Data-Fornix-Mobile API SDK provides a set of methods for iOS applications to authenticate user, capture, save and retrieve data.

SDK provides a set of methods to communicate with server as below:
- Profile Service
- Asset Service

## Getting Started

### Installation
<b>You can achieve the functionality with easy integration of following steps:</b>

- In a new terminal window, run `pod install --repo-update` to install and update. Get [Cocoapods](https://cocoapods.org/)
*you can skip this case if you have updated pod in you mac.*

- Create the podfile in your project.
```
pod init
```

- Open the pod file from directory and add pods in podfile.
```
pod 'DFAPIFramework'
```

- Run command to install
```
pod install
```
<i> If any error occure in the process of pod install then try with pod update command. Now close the xcode project and open prj.xcworkspace instead.</i>

### Authentication
- Add your org's `APIAccessToken` token in your `Info.plist` file.
Format: 
key => "APIAccessToken" 
value => "<Tenant/Organization Name>:<API Access Token>"
e.g: "abc:token"

### Intialization and Accessing Methods
- `import DFAPIFramework` in your class or file to use the framework.
- Now access all of its methods using `ConnectionManager.instance`

Example:

```swift
// call register user method
ConnectionManager.instance.registerUser(name: <USER_NAME>, email: <VALID_USER>, countryCode: <USER_COUNTRY_CODE>, phoneNumber: <USER_PHONE>, success: { response in
// user created successfully
}, failure: { error in
// error while create user
})
```

## Documentation for API Endpoints

| Method Name                                 | Description                                                                                    | Parameters         | Parameter Description                                                                                                      |                    |
|---------------------------------------------|------------------------------------------------------------------------------------------------|--------------------|----------------------------------------------------------------------------------------------------------------------------|--------------------|
| registerUser                                | This method is used to authenticate the user from server.                                      | name               | Name of the user                                                                                                           |                    |
|                                             |                                                                                                | email              | Email address of the user                                                                                                  |                    |
|                                             |                                                                                                | countryCode        | Country code                                                                                                               |                    |
|                                             |                                                                                                | phoneNumber        | Phone number of the user                                                                                                   |                    |
| checkUserSelfie                             | It is used to save the selfie image in database and verify it with other document's user pics. | multipartDataArray | It requires array of 'MultipartDataModal' object.for eg: - [MultipartDataModal.init(type: .image, fileName: "profile_pic"" | data: imageData)]" |
| getAssetsType                               | This method is used to get asset types from server.                                            | NA                 |                                                                                                                            |                    |
| addUpdateAssetDetail                        | Add or update asset details except others type assets.                                         | assetSubTypeParent | requires parent type like identity or utility etc.                                                                         |                    |
|                                             |                                                                                                | assetDetailId      | It is optional field. When you adding asset details to server it is empty but when updating it has asset document id.      |                    |
|                                             |                                                                                                | parametersDict     | In this field, you need to pass the document information with geo_longitude and geo_latitude in a dictionary.              |                    |
| addUpdateAssetDetailForOthers               | Add or update asset details for others type assets.                                            | multipartInfoArray | It requires array of 'MultipartDataModal' object.for eg: - [MultipartDataModal.init(type: .image, fileName: "profile_pic"" | data: imageData)]" |
|                                             |                                                                                                | assetSubTypeParent | requires parent type like identity or utility etc.                                                                         |                    |
|                                             |                                                                                                | assetDetailId      | It is optional field. When you adding asset details to server it is empty but when updating it has asset document id.      |                    |
|                                             |                                                                                                | comment            | comment added to asset of other type                                                                                       |                    |
|                                             |                                                                                                | parametersDict     | It requires dictionary with geo_longitude and geo_latitude.                                                                |                    |
| getDocumentListing                          | get particular document information.                                                           | assetSubTypeId     | asset document id                                                                                                          |                    |
|                                             |                                                                                                | assetSubTypeParent | requires parent type like identity or utility etc.                                                                         |                    |
| getAllSavedAssets                           | get all uploaded assets on server.                                                             | NA                 |                                                                                                                            |                    |
| deleteDocumentAsset                         | remove saved document asset from database.                                                     | assetURL           | requires parent type like identity or utility etc.                                                                         |                    |
|                                             |                                                                                                | assetId            | asset document id                                                                                                          |                    |
| getAlertType                                | Get alert types (like Daily, Weekly, Monthly) from server.                                     | NA                 |                                                                                                                            |                    |
| getAlertsForUser                            | get alerts related to asset expiry.                                                            | NA                 |                                                                                                                            |                    |
| getKeeperInfo                               | get the list of assets which were shared with me.                                              | NA                 |                                                                                                                            |                    |
| organisationRequestForAsset                 | get the list of requests for uploaded asset.                                                   | NA                 |                                                                                                                            |                    |
| organisationRequestForAllUserAssetsByEmail  | get the list of requests for all user assets.                                                  | NA                 |                                                                                                                            |                    |
| organisationRequestForUploadAsset           | get the list of requests to upload the asset.                                                  | NA                 |                                                                                                                            |                    |
| uploadAccessOfAssetToOrganisation           | This method is used to grant or deny access to uploaded asset.                                 | id                 | id of request.                                                                                                             |                    |
|                                             |                                                                                                | sharedWith         | ID of organisation or admin with which asset will be shared                                                                |                    |
|                                             |                                                                                                | assetId            | asset document id                                                                                                          |                    |
|                                             |                                                                                                | timePeriod         | Date upto which asset will be shared                                                                                       |                    |
|                                             |                                                                                                | status             | REJECTED/GRANTED                                                                                                           |                    |
| uploadAccessOfAllAssetByEmailToOrganisation | This method is used to grant or deny the access for all asset request.                         | identifier         | ID of organisation or admin with which asset will be shared                                                                |                    |
|                                             |                                                                                                | status             | REJECTED/GRANTED                                                                                                           |                    |
|                                             |                                                                                                | id                 | id of request.                                                                                                             |                    |
|                                             |                                                                                                | timePeriod         | Date upto which asset will be shared                                                                                       |                    |
| revokeAccessOfAssetToOrganisation           | This method is used to revoke access to organisation.                                          | assetId            | asset document id                                                                                                          |                    |
|                                             |                                                                                                | sharedWith         | ID of organisation or admin with which asset will be shared                                                                |                    |
| requestForShareByMeList                     | get the list of assets which were shared by me.                                                | NA                 |                                                                                                                            |                    |
| getOCRResultFromImage                       | to upload captured image to server and get the scanned data.                                   | multipartDataArray | It requires array of 'MultipartDataModal' object.for eg: - [MultipartDataModal.init(type: .image, fileName: "profile_pic"" | data: imageData)]" |
|                                             |                                                                                                | assetSubTypeName   | asset document name for eg: Passport and Identity card                                                                     |                    |
