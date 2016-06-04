//
//
//  Created by Nash Gadre on 9/17/14.
//

#import "SNFAppConfig.h"

@implementation SNFAppConfig

- (id) init
{
    self = [super init];
    if (self)
    {

    }
    return self;
}

+ (SNFAppConfig *)sharedInstance
{
    static SNFAppConfig *_sharedInstance = nil;
    static dispatch_once_t onceSecurePredicate;
    dispatch_once(&onceSecurePredicate,^
                  {
                      _sharedInstance = [[self alloc] init];
                      [_sharedInstance loadData];
                  });
    return _sharedInstance;
}

//in this example you are saving data to NSUserDefault's
//you could save it also to a file or to some more complex
//data structure: depends on what you need, really

-(void)saveData
{

    [[NSUserDefaults standardUserDefaults] setObject:self.snfDictionary forKey:@"snfDictionary"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"Saving Data");
}

-(void)resetData
{
    self.snfDictionary = nil;
    [[NSUserDefaults standardUserDefaults] setObject:self.snfDictionary forKey:@"snfDictionary"];

    NSLog(@"Reset Data");
    
}

-(void)loadData
{
    NSLog(@"Loading Data");
   
    // SKU Dict
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"snfDictionary"]){
        self.snfDictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"snfDictionary"];
    }
    
}

- (void) loadSNFwithLat :(NSString*)lat withLon :(NSString*) lon andRadius :(NSString*) radius{
    
    NSString* urlString = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",@"http://localhost:8888/snf?",@"lat=",lat,@"&lon=",lon,@"&radius=",radius];
    NSURLRequest *request = [NSURLRequest requestWithURL:
                                [NSURL URLWithString:urlString]];
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    snfJSONData = [NSMutableData data];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"didReceiveResponse");
    [snfJSONData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [snfJSONData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
    NSLog([NSString stringWithFormat:@"Connection failed: %@", [error description]]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connectionDidFinishLoading");
    NSLog(@"Succeeded! Received %lu bytes of data",(unsigned long)[snfJSONData length]);
    
    // convert to JSON
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:snfJSONData options:NSJSONReadingMutableLeaves error:&myError];
    
    // show all values
    for(id key in res) {
        
        id value = [res objectForKey:key];
        
        NSString *keyAsString = (NSString *)key;
        NSString *valueAsString = (NSString *)value;
        
        NSLog(@"key: %@", keyAsString);
        NSLog(@"value: %@", valueAsString);
    }
    
    // extract specific value...
    self.snfDictionary = [res mutableCopy];
    [self saveData];
    // All instances of TestClass will be notified
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"SNFProviderListUpdated"
     object:self];
    
}

@end