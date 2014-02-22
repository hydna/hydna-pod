# Hydna

This the official Objective-C bindings for hydna (in a pod) https://www.hydna.com for full documentation of our API please go to https://www.hydna.com/documentation

Get a free hydna domain at https://www.hydna.com/account/create/

## Usage

Import:

    #import "HYChannel.h"

Implement the following optional **<HYChannelDelegate>** methods:

    - (void)channelOpen:(HYChannel *)sender message:(NSString *)message;

    - (void)channelClose:(HYChannel *)sender error:(HYChannelError *)error;

    - (void)channelMessage:(HYChannel *)sender data:(HYChannelData *)data;

    - (void)channelSignal:(HYChannel *)sender data:(HYChannelSignal)data;

Opening a channel:

    HYChannel * channel = [[HYChannel alloc] init];
    [channel setDelegate:self];
    @try {
        [self.channel connect:@"yourdomain.hydna.net" mode:READWRITEEMIT token:@"optionaltoken"];
    }
    @catch (NSException *exception) {
        NSLog(@"Error: %@", exception.reason);
    }

Sending some data:
    
    [channel writeString:@"Hello World"];

Sending a signal:

    [channel emitString:@"Hello Signal"];

Receiving data:
    
    - (void)channelMessage:(HYChannel *)sender data:(HYChannelData *)data
    {
        NSData *payload = [data content];

        if ([data isUtf8Content]) {
            NSString *message = [[NSString alloc] initWithData:payload encoding:NSUTF8StringEncoding];
            NSLog(@"%@", message);
        } else {
            NSLog(@"Binary data received");
        }
    }

Receiving signal:

    - (void)channelSignal:(HYChannel *)sender data:(HYChannelSignal *)data
    {
        NSData *payload = [data content];

        if ([data isUtf8Content]) {
            NSString *message = [[NSString alloc] initWithData:payload encoding:NSUTF8StringEncoding];
            NSLog(@"%@", message);
        } else {
            NSLog(@"Binary data received");
        }
    }

Handling close:

    - (void)channelClose:(HYChannel *)sender error:(HYChannelError *)error
    {
        if (error.wasDenied) {
            NSLog(@"Connection to hydna was denied: %@", error.reason);
        } else if (error.wasClean) {
            NSLog(@"Connection closed by user or by behavior");
        } else {
            NSLog("Error: %@", error.reason);
        }
    }


# Requirements

ios: 5 +
osx: 10.7 +

## Installation

hydna is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "Hydna"

## Author

Isak Wiström, iw@hydna.com

## License

hydna is available under the MIT license. See the LICENSE file for more info.
