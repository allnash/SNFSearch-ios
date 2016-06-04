//
//  TTAppConfig.h


#import <Foundation/Foundation.h>

@interface SNFAppConfig : NSObject{
    NSMutableData* snfJSONData;
}

+ (SNFAppConfig *)sharedInstance;


@property (strong, nonatomic) NSArray<NSDictionary *>  *snfDictionary;


- (void) saveData;
- (void) loadSNFwithLat :(NSString*)lat withLon :(NSString*) lon andRadius :(NSString*) radius;
- (void) loadData;
- (void) resetData;


@end
