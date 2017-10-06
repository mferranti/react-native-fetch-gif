// RNFetchGif.m
#import "RNFetchGif.h"
#import <React/RCTLog.h>
@implementation RNFetchGif

NSString *const ErrorUnableToSave = @"E_UNABLE_TO_SAVE";

// To export a module named DownloadGif
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(saveToCameraRoll:(NSURLRequest *)request
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    NSData *data = [NSData dataWithContentsOfURL:request.URL];
    
    [library writeImageDataToSavedPhotosAlbum:data metadata:nil completionBlock:^(NSURL *assetURL, NSError *saveError) {
        if (saveError) {
            RCTLogWarn(@"Error saving cropped image: %@", saveError);
            reject(ErrorUnableToSave, nil, saveError);
        } else {
            resolve(assetURL.absoluteString);
        }
    }];
}

@end

